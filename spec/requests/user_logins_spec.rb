require 'rails_helper'

RSpec.describe 'UserLogins', type: :request do
  feature 'User logs in and logs out' do
    describe 'GET /logins' do
      it 'returns 200' do
        get login_path
        expect(response).to have_http_status(200)
      end
    end

    describe 'with invalid information' do
      it 'flash[:danger] on login_path, then removed at home_path' do
        visit login_path
        fill_in 'session[email]', with: 'username'
        fill_in 'session[password]', with: 'password'

        click_button 'Log in'
        expect(page).to have_current_path(login_path)
        expect(page).to have_selector '.alert', text:
                                      'Invalid email/password combination'

        visit home_path
        expect(page).to_not have_selector '.alert', text:
                                          'Invalid email/password combination'
      end
    end

    before(:each) do
      @user = FactoryGirl.create(:user,
                                 password: 'test1234',
                                 password_confirmation: 'test1234')
      page.set_rack_session(user_id: @user.id)

      visit login_path
      fill_in 'session[email]', with: @user.email
      fill_in 'session[password]', with: 'test1234'
    end

    describe 'with valid information' do
      it 'logs in, shows proper links, logs out, removes proper links' do
        click_button 'Log in'
        expect(page).to_not have_link('Log in', href: login_path)
        expect(page).to have_link('Log out', href: logout_path)
        expect(page).to have_link('Profile', href: user_path(@user))

        find(:xpath, "//a[@href='/logout']").click # Logout
        # Simulate a user clicking logout in a second window.
        delete logout_path
        expect(page).to have_link('Log in', href: login_path)
        expect(page).to_not have_link('Log out', href: logout_path)
        expect(page).to_not have_link('Profile', href: user_path(@user))
      end
    end

    describe 'with & without remember_me checked' do
      context 'with remember_me' do
        it 'returns not_nil for session remember_token' do
          find(:css, '#session_remember_me').set(true)
          click_button 'Log in'

          expect(page).to_not have_link('Log in', href: login_path)
          expect(Capybara.current_session.driver.request.cookies.[](
                'remember_token'
          )).to_not be_nil
        end
      end

      context 'without remember_me' do
        it 'sets cookie on remember_me login' do
          find(:css, '#session_remember_me').set(true)
          click_button 'Log in'
        end

        it 'then returns empty for session remember_token' do
          find(:css, '#session_remember_me').set(false)
          click_button 'Log in'

          expect(page).to_not have_link('Log in', href: login_path)
          expect(Capybara.current_session.driver.request.cookies.[](
                'remember_token'
          )).to be_nil
        end
      end
    end
  end
end

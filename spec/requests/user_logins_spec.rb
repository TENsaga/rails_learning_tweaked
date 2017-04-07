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
        expect(page).to have_selector '.alert', text: 'Invalid email/password combination'

        visit home_path
        expect(page).to_not have_selector '.alert', text: 'Invalid email/password combination'
      end
    end

    describe 'with valid information' do
      it 'logs in, shows proper links, logs out, removes proper links' do
        @user = FactoryGirl.create(:user, name: 'Bob Stevens',
                                          email: 'test@hotmail.com',
                                          password: 'test1234',
                                          password_confirmation: 'test1234')
        visit login_path
        fill_in 'session[email]', with: 'test@hotmail.com'
        fill_in 'session[password]', with: 'test1234'

        click_button 'Log in'
        expect(page).to_not have_link('Log in', href: login_path)
        expect(page).to have_link('Log out', href: logout_path)
        expect(page).to have_link('Profile', href: user_path(@user))

        find(:xpath, "//a[@href='/logout']").click # Logout
        expect(page).to have_link('Log in', href: login_path)
        expect(page).to_not have_link('Log out', href: logout_path)
        expect(page).to_not have_link('Profile', href: user_path(@user))
      end
    end
  end
end

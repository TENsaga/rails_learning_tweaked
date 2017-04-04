require 'rails_helper'

describe 'site navigation for', type: :request do
  describe 'root' do
    before { visit root_path }
    it 'returns status 200' do
      expect(page).to have_http_status('200')
    end
    it 'has proper title' do
      expect(page).to have_title(full_title)
    end
  end

  describe 'home' do
    before { visit home_path }
    it 'returns status 200' do
      expect(page).to have_http_status('200')
    end
    it 'has proper title' do
      expect(page).to have_title(full_title)
    end
  end

  describe 'contact' do
    before { visit contact_path }
    it 'returns status 200' do
      expect(page).to have_http_status('200')
    end
    it 'has proper title' do
      expect(page).to have_title(full_title('Contact'))
    end
  end

  describe 'about' do
    before { visit about_path }
    it 'returns status 200' do
      expect(page).to have_http_status('200')
    end
    it 'has proper title' do
      expect(page).to have_title(full_title('About'))
    end
  end

  describe 'help' do
    before { visit help_path }
    it 'returns status 200' do
      expect(page).to have_http_status('200')
    end
    it 'has proper title' do
      expect(page).to have_title(full_title('Help'))
    end
  end

  describe 'signup' do
    before { visit signup_path }
    it 'returns 200' do
      expect(page).to have_http_status('200')
    end
    it 'has proper title' do
      expect(page).to have_title(full_title('Sign up'))
    end
  end

  describe 'login' do
    before { visit login_path }
    it 'returns 200' do
      expect(page).to have_http_status('200')
    end

    it 'has proper title' do
      expect(page).to have_title(full_title('Log in'))
    end
  end
end

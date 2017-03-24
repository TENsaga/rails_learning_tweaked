require 'rails_helper'

describe 'static_pages/_.html.erb', type: :view do
  describe 'home.html.erb' do
    it 'displays proper title' do
      visit home_url
      expect(page).to have_title('Ruby on Rails Tutorial Sample App')
    end
  end

  describe 'about.html.erb' do
    it 'displays proper title' do
      visit about_url
      expect(page).to have_title('About | Ruby on Rails Tutorial Sample App')
    end
  end

  describe 'contact.html.erb' do
    it 'displays proper title' do
      visit contact_url
      expect(page).to have_title('Contact | Ruby on Rails Tutorial Sample App')
    end
  end

  describe 'help.html.erb' do
    it 'displays proper title' do
      visit help_url
      expect(page).to have_title('Help | Ruby on Rails Tutorial Sample App')
    end
  end
end

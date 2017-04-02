require 'rails_helper'

describe 'site layout', type: :request do
  describe 'GET root_path' do
    it 'renders the home template' do
      expect(get root_path).to render_template(:home)
    end

    describe 'home links and values' do
      before { visit root_path }
      it 'renders all links' do
        expect(page).to have_link('Home', href: root_path)
        expect(page).to have_link('Help', href: help_path)
        expect(page).to have_link('About', href: about_path)
        expect(page).to have_link('Contact', href: contact_path)
        expect(page).to have_link('Sign up now!', href: signup_path)
      end
    end
  end
end

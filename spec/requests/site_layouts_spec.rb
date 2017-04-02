require 'rails_helper'

describe 'site layout', type: :request do
  describe 'GET root_path' do
    it 'renders the home template' do
      expect(get root_path).to render_template(:home)
    end

    describe 'home links and values' do
      before { visit home_path }

      it 'renders all links' do
        expect(page).to have_link('Home', href: root_path)
        expect(page).to have_link('Help', href: help_path)
        expect(page).to have_link('About', href: about_path)
        expect(page).to have_link('Contact', href: contact_path)
        expect(page).to have_link('Sign up now!', href: signup_path)
      end
    end
  end

  describe 'site navigation for' do
    describe 'root' do
      before { visit root_path }
      it 'returns status 200' do
        expect(page).to have_http_status '200'
      end
      it 'has proper title' do
        expect(page).to have_title(full_title)
      end
    end

    describe 'home' do
      before { visit home_path }
      it 'returns status 200' do
        expect(page).to have_http_status '200'
      end
      it 'has proper title' do
        expect(page).to have_title(full_title)
      end
    end

    describe 'contact' do
      before { visit contact_path }
      it 'returns status 200' do
        expect(page).to have_http_status '200'
      end
      it 'has proper title' do
        expect(page).to have_title(full_title('Contact'))
      end
    end

    describe 'about' do
      before { visit about_path }
      it 'returns status 200' do
        expect(page).to have_http_status '200'
      end
      it 'has proper title' do
        expect(page).to have_title(full_title('About'))
      end
    end

    describe 'help' do
      before { visit help_path }
      it 'returns status 200' do
        expect(page).to have_http_status '200'
      end
      it 'has proper title' do
        expect(page).to have_title(full_title('Help'))
      end
    end

    describe 'signup' do
      before { visit signup_path }
      it 'returns 200' do
        expect(page).to have_http_status '200'
      end
      it 'has proper title' do
        expect(page).to have_title(full_title('Sign up'))
      end
    end
  end
end

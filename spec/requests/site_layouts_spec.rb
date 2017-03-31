require 'rails_helper'

describe 'static_pages/home', type: :request do
  describe 'GET root_path' do
    subject { get root_path }
    it { is_expected.to eq 200 }
    it { is_expected.to render_template(:home) }

    describe 'home links and values' do
      before { visit home_path }

      it 'renders all links' do
        expect(page).to have_link('Home', href: root_path)
        expect(page).to have_link('Help', href: help_path)
        expect(page).to have_link('About', href: about_path)
        expect(page).to have_link('Contact', href: contact_path)
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

      describe 'Contact' do
        before { visit contact_path }
        it 'returns status 200' do
          expect(page).to have_http_status '200'
        end
        it 'has proper title' do
          expect(page).to have_title(full_title('Contact'))
        end
      end

      describe 'About' do
        before { visit about_path }
        it 'returns status 200' do
          expect(page).to have_http_status '200'
        end
        it 'has proper title' do
          expect(page).to have_title(full_title('About'))
        end
      end

      describe 'Help' do
        before { visit help_path }
        it 'returns status 200' do
          expect(page).to have_http_status '200'
        end
        it 'has proper title' do
          expect(page).to have_title(full_title('Help'))
        end
      end
    end
  end
end

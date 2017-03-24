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

    describe 'verify title' do
      before { visit contact_path }

      it 'shows proper title' do
        expect(page).to have_title(full_title('Contact'))
      end
    end
  end
end

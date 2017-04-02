require 'rails_helper'

describe 'site navigation', type: :request do
  describe 'root' do
    before { get root_path }
    it 'has value success' do
      expect(response).to be_success
    end

    it 'renders the home template' do
      expect(response).to render_template(:home)
    end
  end

  describe 'home' do
    it 'has value success' do
      get home_path
      expect(response).to be_success
    end
  end

  describe 'help' do
    it 'has value success' do
      get help_path
      expect(response).to be_success
    end
  end

  describe 'about' do
    it 'has value success' do
      get about_path
      expect(response).to be_success
    end
  end

  describe 'contact' do
    it 'has value success' do
      get contact_path
      expect(response).to be_success
    end
  end

  describe 'users#new' do
    it 'has value success' do
      get signup_path
      expect(response).to be_success
    end
  end

end

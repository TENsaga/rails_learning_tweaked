require 'rails_helper'

describe 'site navigation', type: :request do
  describe 'root' do
    it 'has value success' do
      expect(get: root_url).to redirect_to('static_pages#home')
      expect(response).to be_success
    end
  end

  describe 'home' do
    it 'has value success' do
      get :home
      expect(response).to be_success
    end
  end

  describe 'help' do
    it 'has value success' do
      get :help
      expect(response).to be_success
    end
  end

  describe 'about' do
    it 'has value success' do
      get :about
      expect(response).to be_success
    end
  end

  describe 'contact' do
    it 'has value success' do
      get :contact
      expect(response).to be_success
    end
  end
end

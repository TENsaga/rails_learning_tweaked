require 'rails_helper'

RSpec.describe 'UsersSignups', type: :request do
  describe 'GET /users_signups' do
    it 'returns 200' do
      get signup_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'test invalid form submission' do
    it 'fails and renders users/new with 4 errors' do
      expect do
        post users_path, params: { user: { name: '',
                                           email: 'user@invalid',
                                           password: 'foo',
                                           password_confirmation: 'bar' } }
      end.to_not change { User.count }
      expect(response.body).to include('Sign up')
      expect(response.body).to include('The form contains 4 errors.')
    end
  end

  describe 'test valid form submission' do
    it 'creates user and renders users/show' do
      expect do
        post users_path, params: { user: { name: 'Example User',
                                           email: 'user@example.com',
                                           password: 'password',
                                           password_confirmation: 'password' } }
      end.to change { User.count }.by(1)
      follow_redirect!
      expect(response).to render_template('users/show')
      expect(flash[:success]).to eq 'Welcome to the Sample App!'
    end
  end
end

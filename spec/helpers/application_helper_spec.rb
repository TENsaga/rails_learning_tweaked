require 'rails_helper'

class ApplicationHelperTest < ActionView::TestCase
  describe 'full title helper' do
    it 'displays proper title' do
      expect(full_title).to eq 'Ruby on Rails Tutorial Sample App'
      expect(full_title('Help')).to eq 'Help | Ruby on Rails Tutorial Sample App'
    end
  end
end
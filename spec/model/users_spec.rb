# spec/models/users_spec.rb
require 'rails_helper'

describe User do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:user)).to be_valid
  end
  it 'is invalid without name' do
    expect(FactoryGirl.build(:user, name: nil)).to_not be_valid
  end
  it 'is invalid wihtout email' do
    expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
  end

  it 'returns firstname as string' do
    expect(FactoryGirl.build(:user).name).to be_a(String)
  end

  it 'returns email as string' do
    expect(FactoryGirl.build(:user).email).to be_a(String)
  end

  describe 'filter name by letter' do
    before :each do
      @joesmith = FactoryGirl.create(:user, name: 'Joe Smith')
      @jakeholmes = FactoryGirl.create(:user, name: 'Jake Holmes')
      @stevenash = FactoryGirl.create(:user, name: 'Steve Nash')
    end

    context 'matching letters' do
      it 'returns a sotred array of results that match' do
        expect(User.by_letter('J')).to eq [@jakeholmes, @joesmith]
      end
    end

    context 'non-matching letters' do
      it 'does not return contacts that don"t start with provided letter' do
        expect(User.by_letter('J')).to_not include @stevenash
      end
    end
  end
end

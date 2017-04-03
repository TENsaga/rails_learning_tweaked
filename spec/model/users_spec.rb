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

  it 'is invalid if name > 50 char' do
    expect(FactoryGirl.build(:user, name: ("abcde" * 11))).to_not be_valid
  end

  it 'is invalid if email > 250 char' do
    expect(FactoryGirl.build(:user, email: ("abcde" * 51))).to_not be_valid
  end

  it 'accepts valid email addresses' do
    valid_emails = %w[user@example.com SER@foo.COM A_US-ER@foo.bar.org
                      first.last@foo.jp alice+bob@baz.cn]

    valid_emails.each do |email|
      expect(FactoryGirl.build(:user, email: email)).to be_valid,
            "#{email.inspect} should be valid"
    end
  end

  it 'rejects invalid email addresses' do
    invalid_emails = %w[user@example,com user_at_foo.org user.name@example.
                        foo@bar_baz.com foo@bar+baz.com foo@bar..com]

    invalid_emails.each do |email|
      expect(FactoryGirl.build(:user, email: email)).to_not be_valid,
            "#{email.inspect} should be invalid"
    end
  end

  it 'rejects duplicate case insensitive emails' do
    FactoryGirl.create(:user, email: "joe@test.com")
    expect(FactoryGirl.build(:user, email: "JOE@TEST.COM")).to_not be_valid
  end

  it 'saves emails as downcase' do
    lowcase_user = FactoryGirl.create(:user, email: "JOE@TEST.COM")
    expect(lowcase_user.email).to eq lowcase_user.email.downcase
  end

  it 'rejects blank password' do
    expect(FactoryGirl.build(:user, password: ' ' * 8)).to_not be_valid
  end

  it 'rejects invalid password length < 8' do
    expect(FactoryGirl.build(:user, password: 'nope',
                             password_confirmation: 'nope')).to_not be_valid
  end

  it 'accepts valid password length >= 8' do
    expect(FactoryGirl.build(:user, password: 'nope1234',
                             password_confirmation: 'nope1234')).to be_valid
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

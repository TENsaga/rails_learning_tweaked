# spec/factories/users.rb
require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.name      { Faker::Name.name }
    f.email     { Faker::Internet.email }
    f.password  { Faker::Internet.password(min_length = 8, max_length = 16) }
  end
end

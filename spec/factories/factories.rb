require 'faker'

FactoryGirl.define do
  factory :user do
    first_name {"#{Faker::Name.first_name}"}
    last_name {"#{Faker::Name.last_name}"}
    email {"#{Faker::Internet.email}"}
    headline "New HoneHouse member"
    gender 'Male'
    password 'swordfish'
  end

  factory :course do
    title {"#{Faker::Lorem.word}"}
    subtitle {"#{Faker::Lorem.sentence}"}
    sport 'Lacrosse'
  end
end

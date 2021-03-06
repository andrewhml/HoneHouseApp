require 'faker'

FactoryGirl.define do
  factory :user do
    first_name {"#{Faker::Name.first_name}"}
    last_name {"#{Faker::Name.last_name}"}
    email {"#{Faker::Internet.email}"}
    headline "New HoneHouse Member"
    gender 'Male'
    password 'swordfish'
    confirmed_at "#{Time.now}"
  end

  factory :course do
    title {"#{Faker::Lorem.word}"}
    subtitle {"#{Faker::Lorem.sentence}"}
    url {"#{Faker::Internet.url}"}
    description {"#{Faker::Lorem.sentence}"}
    sport 'Lacrosse'
  end

  factory :membership do
    role 'teacher'
    user
    course
  end

  factory :unit do
    unit_number {"#{Faker::Number.digit}"}
    title {"#{Faker::Lorem.word}"}
    description {"#{Faker::Lorem.sentence}"}
    course
  end

  factory :lesson do
    title {"#{Faker::Lorem.word}"}
    description {"#{Faker::Lorem.sentence}"}
    unit
  end

  factory :video do
    url {"#{Faker::Internet.url}"}
    lesson
  end

  factory :resource do
    title {"#{Faker::Lorem.word}"}
    url {"#{Faker::Internet.url}"}
    lesson
  end

  factory :review do
    body {"#{Faker::Lorem.sentence}"}
    user
    course
  end
end

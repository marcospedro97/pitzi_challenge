# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birth_date { 30.years.ago.to_date }
    gender { 'male' }
    document { Faker::CPF.numeric }
    email { Faker::Internet.unique.email }

    trait :with_phones_and_address do
      after :create do |customer, _|
        create(:phone, customer: customer)
        create(:address, customer: customer)
      end
    end
  end
end

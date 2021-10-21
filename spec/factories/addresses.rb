# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    street { Faker::Address.street_name }
    postal_code { Faker::Address.zip_code }
    number { '11' }
    complement { Faker::Address.secondary_address }
    neighborhood { Faker::Address.community }
    customer { nil }
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :plan do
    name { 'Cool plan' }
    value { 100 }
    description { 'Only cool customers can have' }
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :phone do
    number { 11_967_824_553 }
    customer { nil }
  end
end

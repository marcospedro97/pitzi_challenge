# frozen_string_literal: true

FactoryBot.define do
  factory :smartphone do
    model { 'Galaxy S20' }
    manufacturer { 'Samsung' }
    release { '2020' }
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    customer { create(:customer) }
    plan { create(:plan) }
    smartphone { create(:smartphone) }
    imei { '527125743724584' }
  end
end

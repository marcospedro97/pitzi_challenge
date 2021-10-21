# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :plan
  belongs_to :customer
  belongs_to :smartphone

  validates :imei, presence: true
end

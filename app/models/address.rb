# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :customer

  validates :number, :street, :neighborhood, :postal_code, presence: true
end

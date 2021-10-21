# frozen_string_literal: true

class Customer < ApplicationRecord
  include Hashid::Rails

  has_many :phones, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :plans, through: :orders
  accepts_nested_attributes_for :addresses, :phones

  validates :document, uniqueness: true
  validates :email, uniqueness: true
  validates(
    :email,
    :document,
    :first_name,
    :last_name,
    :birth_date,
    :gender,
    presence: true
  )
end

# frozen_string_literal: true

module Customers
  # Customers::FetchPage
  class FetchPage
    def self.list(page: nil)
      customer.page(page || 1).per(25).as_json.map do |v|
        OpenStruct.new(v)
      end
    end

    def self.customer
      Customer.where(nil)
    end
  end
end

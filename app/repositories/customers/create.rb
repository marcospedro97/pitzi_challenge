# frozen_string_literal: true

module Customers
  class Create
    def self.create_with_phones_and_addresses(params)
      OpenStruct.new Customer.create(params).as_json(
        include: %i[phones addresses]
      )
    end
  end
end

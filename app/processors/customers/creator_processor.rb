# frozen_string_literal: true

module Customers
  # Customers::CreatorProcessor
  class CreatorProcessor
    class DryException < ::StandardError; end

    def self.call(params = {})
      return raise DryException, 
validate(params: params).errors.to_h.to_json unless validate(params: params).success?

      Create.create_with_phones_and_addresses(params)
    end

    def self.validate(params:)
      CustomersContract.new.call(params)
    end
  end
end

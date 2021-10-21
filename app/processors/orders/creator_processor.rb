# frozen_string_literal: true

module Orders
  # Customers::CreatorProcessor
  class CreatorProcessor
    class DryException < ::StandardError; end

    def self.call(params = {})
      return raise DryException, 
validate(params: params).errors.to_h.to_json unless validate(params: params).success?

      Create.create(params)
    end

    def self.validate(params:)
      OrdersContract.new.call(params)
    end
  end
end

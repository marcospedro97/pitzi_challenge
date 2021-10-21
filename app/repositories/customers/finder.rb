# frozen_string_literal: true

module Customers
  # Customers::Finder
  class Finder
    def self.find(params)
      OpenStruct.new Customer.joins(:phones).
                             joins(:addresses).
                             find_by(params).as_json(include: %i[phones addresses])
    end
  end
end

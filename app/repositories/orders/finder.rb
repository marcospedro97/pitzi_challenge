# frozen_string_literal: true

module Orders
  class Finder
    def self.find(params)
      OpenStruct.new Order.joins(:customer).
                          joins(:plan).
                          joins(:smartphone).
                          find_by(params).as_json(include: %i[customer plan smartphone])
    end
  end
end

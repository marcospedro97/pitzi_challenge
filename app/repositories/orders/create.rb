# frozen_string_literal: true

module Orders
  class Create
    def self.create(params)
      OpenStruct.new Order.create(params).as_json(
        include: %i[plan customer]
      )
    end
  end
end

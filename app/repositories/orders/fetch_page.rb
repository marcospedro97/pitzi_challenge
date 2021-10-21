# frozen_string_literal: true

module Orders
  class FetchPage
    def self.list_by(customer_id:, page: nil)
      orders.where(customer_id: customer_id).page(page || 1).per(25).as_json(
        include: %i[customer plan]
      ).map do |v|
        OpenStruct.new(v)
      end
    end

    def self.orders
      Order.where(nil).joins(:customer).joins(:plan)
    end
  end
end

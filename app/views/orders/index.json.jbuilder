# frozen_string_literal: true

json.orders @orders do |order|
  json.id order.id
  json.customer_first_name order.customer[:first_name]
  json.plan_name order.plan[:name]
  json.plan_value order.plan[:value]
end

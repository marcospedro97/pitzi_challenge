# frozen_string_literal: true

json.order do
  json.id @order.id
  json.imei @order.imei
  json.customer do
    json.first_name @order.customer['first_name']
    json.last_name @order.customer['last_name']
    json.document @order.customer['document']
    json.email @order.customer['email']
  end

  json.plan do
    json.name @order.plan['name']
    json.description @order.plan['description']
    json.value @order.plan['value']
  end
end

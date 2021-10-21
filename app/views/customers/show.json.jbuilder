# frozen_string_literal: true

json.customer do
  json.id @customer.id
  json.first_name @customer.first_name
  json.last_name @customer.last_name
  json.document @customer.document
  json.gender @customer.gender
  json.birth_date @customer.birth_date
  if @customer.phones.present?
    json.phones @customer.phones.each do |phone|
      json.number phone['number']
    end
  end

  if @customer.addresses.present?
    json.addresses @customer.addresses.each do |address|
      json.street address['street']
      json.number address['number']
      json.complement address['complement']
      json.neighborhood address['neighborhood']
      json.postal_code address['postal_code']
    end
  end
end

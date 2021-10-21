# frozen_string_literal: true

class OrdersContract < ApplicationContract
  schema do
    required(:customer_id).filled(:string)
    required(:plan_id).filled(:string)
    required(:smartphone_id).filled(:string)
    required(:imei).filled(:string)
  end

  rule(:imei) do |index:|
    key.failure I18n.t('errors.invalid_format.imei') unless
      value.match?(/[0-9]{15}/i)
  end
end

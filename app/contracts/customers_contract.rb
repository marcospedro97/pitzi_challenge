# frozen_string_literal: true

class CustomersContract < ApplicationContract
  schema do
    required(:email).filled(:string)
    required(:first_name).filled(:string)
    required(:last_name).filled(:string)
    required(:document).filled(:string)
    required(:gender).filled(:string)
    required(:birth_date).filled(:string)

    required(:addresses_attributes).value(:array, min_size?: 1).each do
      hash do
        required(:street).filled(:string)
        required(:number).filled(:string)
        required(:postal_code).filled(:string)
        required(:neighborhood).filled(:string)
        optional(:complement).filled(:string)
      end
    end

    required(:phones_attributes).value(:array, min_size?: 1).each do
      hash do
        required(:number).filled(:string)
      end
    end
  end

  rule(:birth_date) do |index:|
    unless value.match?(%r{(\d{1,2}[-/]\d{1,2}[-/]\d{4})|(\d{4}[-/]\d{1,2}[-/]\d{1,2})}i)
      key.failure(I18n.t('errors.invalid_format.birth_date'))
    end
  end

  rule(:phones_attributes).each do |index:|
    next if value[:number].match?(
      /[0-9]{11}/i
    )

    key([:phones, :number, index]).failure(
      I18n.t('errors.invalid_format.phone_number')
    )
  end

  rule(:addresses_attributes).each do |index:|
    next if value[:number].match?(
      /[0-9]/i
    )

    key([:addresses_attributes, :number, index]).failure(
      I18n.t('errors.invalid_format.phone_number')
    )
  end

  rule(:addresses_attributes).each do |index:|
    next if value[:postal_code].match?(/[0-9]{5}-[0-9]{3}/i)

    key([:addresses_attributes, :postal_code, index]).failure(
      I18n.t('errors.invalid_format.postal_code')
    )
  end

  rule(:gender) do
    key.failure(I18n.t('errors.invalid_format.gender')) unless
      GenderEnum.list.include? value
  end

  rule(:document) do
    if /[a-zA-Z\W]/i.match?(value) || value.length != 11
      key.failure(I18n.t('errors.invalid_format.document'))
    end
  end

  rule(:email) do
    unless /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.match?(value)
      key.failure(I18n.t('errors.invalid_format.email'))
    end
  end
end

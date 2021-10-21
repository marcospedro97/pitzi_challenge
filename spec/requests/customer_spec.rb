# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Customer', type: :request do
  it 'should return index' do
    # ARRANGE
    customers = create_list(:customer, 5)
    # ACT
    get customers_path, params: { format: 'json' }
    json = JSON.parse(response.body, symbolize_names: true)
    # ASSERT
    expect(response).to have_http_status(200)
    expect(json[:customers].length).to eq(5)
    expect(json[:customers].first[:id]).not_to eq(nil)
    expect(json[:customers].first[:first_name]).not_to eq(nil)
    expect(json[:customers].first[:last_name]).not_to eq(nil)
  end

  it 'should return show' do
    # ARRANGE
    customer = create(:customer, :with_phones_and_address)
    # ACT
    get customer_path(customer.id), params: { format: 'json' }
    json = JSON.parse(response.body, symbolize_names: true)
    # ASSERT
    expect(response).to have_http_status(200)
    expect(json.dig(:customer, :id)).to eq(customer.id)
    expect(json.dig(:customer, :first_name)).to eq(customer.first_name)
    expect(json.dig(:customer, :last_name)).to eq(customer.last_name)
    expect(json.dig(:customer, :document)).to eq(customer.document)
    expect(json.dig(:customer, :gender)).to eq(customer.gender)
    expect(json.dig(:customer, :birth_date)).to eq(customer.birth_date.to_s)
    expect(json.dig(:customer, :phones).first[:number]).
      to eq(customer.phones.first.number)
    expect(json.dig(:customer, :addresses).first[:number]).
      to eq(customer.addresses.first.number)
    expect(json.dig(:customer, :addresses).first[:street]).
      to eq(customer.addresses.first.street)
    expect(json.dig(:customer, :addresses).first[:neighborhood]).
      to eq(customer.addresses.first.neighborhood)
    expect(json.dig(:customer, :addresses).first[:complement]).
      to eq(customer.addresses.first.complement)
    expect(json.dig(:customer, :addresses).first[:postal_code]).
      to eq(customer.addresses.first.postal_code)
  end

  it 'should create' do
    # ARRANGE
    customer = build(:customer)
    phone = build(:phone)
    address = build(:address)
    # ACT
    post customers_path, params: {
      format: 'json',
      headers: {
        'Content-Type' => 'application/json'
      },
      customer: {
        first_name: customer.first_name,
        last_name: customer.last_name,
        document: customer.document,
        gender: customer.gender,
        birth_date: customer.birth_date,
        email: customer.email,
        addresses_attributes: [{
          street: address.street,
          number: address.number,
          neighborhood: address.neighborhood,
          postal_code: address.postal_code,
          complement: address.complement
        }],
        phones_attributes: [{
          number: phone.number
        }]
      }
    }
    json = JSON.parse(response.body, symbolize_names: true)
    # ASSERT
    expect(response).to have_http_status(:created)
    expect(json.dig(:customer, :id)).to eq(Customer.last.id)
  end

  it 'should not create with invalid params' do
    # ARRANGE
    customer = build(:customer)
    phone = build(:phone)
    address = build(:address)
    # ACT
    post(
      customers_path, params: {
        format: 'json',
        headers: {
          'Content-Type' => 'application/json'
        },
        customer: {
          first_name: customer.first_name,
          last_name: customer.last_name,
          document: customer.document,
          gender: customer.gender,
          birth_date: customer.birth_date,
          email: '2',
          addresses_attributes: [{
            street: address.street,
            number: address.number,
            neighborhood: address.neighborhood,
            postal_code: 'address.postal_code',
            complement: address.complement
          }],
          phones_attributes: [{
            number: phone.number
          }]
        }
      }
    )
    json = JSON.parse(response.body, symbolize_names: true)
    # ASSERT
    expect(response).to have_http_status(500)
  end
end

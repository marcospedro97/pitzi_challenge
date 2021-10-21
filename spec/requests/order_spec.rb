# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Order', type: :request do
  it 'should create a order' do
    customer = create(:customer, :with_phones_and_address)
    plan = create(:plan)
    smartphone = create(:smartphone)

    # ACT
    post orders_path(customer.id), params: {
      format: 'json',
      headers: {
        'Content-Type' => 'application/json'
      },
      order: {
        customer_id: customer.id,
        smartphone_id: smartphone.id,
        plan_id: plan.id,
        imei: '527125743724584'
      }
    }
    json = JSON.parse(response.body, symbolize_names: true)
    # ASSERT
    expect(response).to have_http_status(201)
    expect(json.dig(:order, :customer, :first_name)).to eq(customer.first_name)
    expect(json.dig(:order, :customer, :last_name)).to eq(customer.last_name)
    expect(json.dig(:order, :customer, :document)).to eq(customer.document)
    expect(json.dig(:order, :plan, :name)).to eq(plan.name)
    expect(json.dig(:order, :plan, :value)).to eq(plan.value.to_s)
    expect(json.dig(:order, :plan, :description)).to eq(plan.description)
    expect(json.dig(:order, :id)).to eq(Order.last.id)
    expect(json.dig(:order, :imei)).to eq('527125743724584')
  end

  it 'should create a order' do
    customer = create(:customer, :with_phones_and_address)
    plan = create(:plan)
    smartphone = create(:smartphone)

    # ACT
    post orders_path(customer.id), params: {
      format: 'json',
      headers: {
        'Content-Type' => 'application/json'
      },
      order: {
        customer_id: customer.id,
        smartphone_id: smartphone.id,
        plan_id: plan.id,
        imei: '527125'
      }
    }
    json = JSON.parse(response.body, symbolize_names: true)
    # ASSERT
    expect(response).to have_http_status(500)
  end

  it 'should return show' do
    # ARRANGE
    order = create(:order)
    # ACT
    get customer_order_path(customer_id: order.customer.id, id: order.id), 
params: { format: 'json' }
    json = JSON.parse(response.body, symbolize_names: true)
    # ASSERT
    expect(response).to have_http_status(200)
    expect(json.dig(:order, :customer, :first_name)).to eq(order.customer.first_name)
    expect(json.dig(:order, :customer, :last_name)).to eq(order.customer.last_name)
    expect(json.dig(:order, :customer, :document)).to eq(order.customer.document)
    expect(json.dig(:order, :plan, :name)).to eq(order.plan.name)
    expect(json.dig(:order, :plan, :value)).to eq(order.plan.value.to_s)
    expect(json.dig(:order, :plan, :description)).to eq(order.plan.description)
    expect(json.dig(:order, :id)).to eq(order.id)
    expect(json.dig(:order, :imei)).to eq(order.imei)
  end

  it 'should return index' do
    # ARRANGE
    customer = create(:customer)
    orders = create_list(:order, 5, customer: customer)
    # ACT
    get customer_orders_path(customer.id), params: { format: 'json' }
    json = JSON.parse(response.body, symbolize_names: true)
    # ASSERT
    expect(response).to have_http_status(200)
    expect(json[:orders].length).to eq(5)
  end
end

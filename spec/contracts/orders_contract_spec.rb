# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrdersContract do
  let(:subject) { OrdersContract.new }

  context 'valid' do
    let(:params) do
      {
        customer_id: '1',
        smartphone_id: '1',
        plan_id: '1',
        imei: '527125743724584'
      }
    end

    it do
      expect(subject.call(params).success?).to eq(true)
    end
  end

  context 'invalid' do
    let(:params) do
      {
        customer_id: '1',
        smartphone_id: '1',
        plan_id: '1',
        imei: '527125743724584'
      }
    end

    it 'without customer_id' do
      params[:customer_id] = nil
      expect(subject.call(params).success?).to eq(false)
    end

    it 'without smartphone_id' do
      params[:smartphone_id] = nil
      expect(subject.call(params).success?).to eq(false)
    end

    it 'without plan_id' do
      params[:plan_id] = nil
      expect(subject.call(params).success?).to eq(false)
    end

    it 'without imei' do
      params[:imei] = nil
      expect(subject.call(params).success?).to eq(false)
    end

    it 'with invalid imei' do
      params[:imei] = 'nil'
      expect(subject.call(params).success?).to eq(false)
    end
  end
end

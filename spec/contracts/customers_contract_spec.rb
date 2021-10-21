# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CustomersContract do
  let(:subject) { CustomersContract.new }

  context 'valid' do
    let(:customer) do
      build(:customer,
            addresses: [build(:address)],
            phones: [build(:phone)])
    end
    let(:params) do
      {
        first_name: customer.first_name,
        last_name: customer.last_name,
        document: customer.document,
        gender: customer.gender,
        birth_date: customer.birth_date.to_s,
        email: customer.email,
        addresses_attributes: [{
          street: customer.addresses.first.street,
          number: customer.addresses.first.number.to_s,
          neighborhood: customer.addresses.first.neighborhood,
          postal_code: customer.addresses.first.postal_code,
          complement: customer.addresses.first.complement
        }],
        phones_attributes: [{
          number: customer.phones.first.number
        }]
      }
    end

    it do
      expect(subject.call(params).success?).to eq(true)
    end

    it 'without complement' do
      params[:addresses_attributes].first.delete(:complement)
      expect(subject.call(params).success?).to eq(true)
    end
  end

  context 'invalid' do
    let(:customer) do
      build(:customer,
            addresses: [build(:address)],
            phones: [build(:phone)])
    end
    let(:params) do
      {
        first_name: customer.first_name,
        last_name: customer.last_name,
        document: customer.document,
        gender: customer.gender,
        birth_date: customer.birth_date.to_s,
        email: customer.email,
        addresses_attributes: [{
          street: customer.addresses.first.street,
          number: customer.addresses.first.number.to_s,
          neighborhood: customer.addresses.first.neighborhood,
          postal_code: customer.addresses.first.postal_code,
          complement: customer.addresses.first.complement
        }],
        phones_attributes: [{
          number: customer.phones.first.number
        }]
      }
    end

    it 'without first_name' do
      params[:first_name] = nil
      expect(subject.call(params).success?).to eq(false)
    end

    it 'without last_name' do
      params[:last_name] = nil
      expect(subject.call(params).success?).to eq(false)
    end

    it 'without document' do
      params[:document] = nil
      expect(subject.call(params).success?).to eq(false)
    end

    it 'with invalid document' do
      params[:document] = 'nil'
      expect(subject.call(params).success?).to eq(false)
    end

    it 'without gender' do
      params[:gender] = nil
      expect(subject.call(params).success?).to eq(false)
    end

    it 'with invalid gender' do
      params[:gender] = 'nil'
      expect(subject.call(params).success?).to eq(false)
    end

    it 'without birth_date' do
      params[:birth_date] = nil
      expect(subject.call(params).success?).to eq(false)
    end

    it 'with birth_date in the wrong format' do
      params[:birth_date] = 'nil'
      expect(subject.call(params).success?).to eq(false)
    end

    it 'without email' do
      params[:email] = nil
      expect(subject.call(params).success?).to eq(false)
    end

    it 'with email in the wrong format' do
      params[:email] = 'nil.com'
      expect(subject.call(params).success?).to eq(false)
    end

    it 'without phones_attributes' do
      params[:phones_attributes] = nil
      expect(subject.call(params).success?).to eq(false)
    end

    context 'phones_attributes' do
      it 'with masked number' do
        params[:phones_attributes].first[:number] = '(11) 96782-4553'
        expect(subject.call(params).success?).to eq(false)
      end
    end

    it 'without addresses_attributes' do
      params[:addresses_attributes] = nil
      expect(subject.call(params).success?).to eq(false)
    end

    context 'addresses_attributes' do
      it 'without street' do
        params[:addresses_attributes].first[:street] = nil
        expect(subject.call(params).success?).to eq(false)
      end

      it 'without number' do
        params[:addresses_attributes].first[:number] = nil
        expect(subject.call(params).success?).to eq(false)
      end

      it 'with invalid number' do
        params[:addresses_attributes].first[:number] = 'nil'
        expect(subject.call(params).success?).to eq(false)
      end

      it 'without neighborhood' do
        params[:addresses_attributes].first[:neighborhood] = nil
        expect(subject.call(params).success?).to eq(false)
      end

      it 'without complement' do
        params[:addresses_attributes].first[:complement] = nil
        expect(subject.call(params).success?).to eq(false)
      end
    end
  end
end

# frozen_string_literal: true

class CustomersController < ApplicationController
  def index
    @customers = Customers::FetchPage.list(page: params[:page])
  end

  def show
    @customer = Customers::Finder.find({ id: params[:id] })
  end

  def create
    @customer = Customers::CreatorProcessor.call(customer_params.to_h)

    render :show, status: :created
  rescue StandardError => e
    render json: e.message, status: 500
  end

  private

  def customer_params
    params.require(:customer).permit(
      :first_name, :last_name, :gender, :birth_date, :email, :document,
      addresses_attributes: %i[postal_code street number complement neighborhood],
      phones_attributes: %i[number]
    )
  end
end

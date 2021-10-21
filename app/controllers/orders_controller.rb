# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @orders = Orders::FetchPage.list_by(
      customer_id: params[:customer_id],
      page: params[:page]
    )
  end

  def show
    @order = Orders::Finder.find({
                                   id: params[:id],
                                   customer_id: params[:customer_id]
                                 })
  end

  def create
    @order = Orders::CreatorProcessor.call(orders_params.to_h)
    render :show, status: :created
  rescue StandardError => e
    render json: e.message, status: 500
  end

  private

  def orders_params
    params.require(:order).permit(
      :customer_id, :plan_id, :smartphone_id, :imei
    )
  end
end

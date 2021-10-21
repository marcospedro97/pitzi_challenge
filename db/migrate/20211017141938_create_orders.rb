# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :plan, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.references :smartphone, null: false, foreign_key: true
      t.string :imei

      t.timestamps
    end
  end
end

# frozen_string_literal: true

class AddEmailToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :email, :string, unique: true, index: true
  end
end

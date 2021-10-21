# frozen_string_literal: true

class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.string :name
      t.decimal :value
      t.string :description

      t.timestamps
    end
  end
end

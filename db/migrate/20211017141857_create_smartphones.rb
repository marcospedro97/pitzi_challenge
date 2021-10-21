# frozen_string_literal: true

class CreateSmartphones < ActiveRecord::Migration[6.1]
  def change
    create_table :smartphones do |t|
      t.string :model
      t.string :manufacturer
      t.date :release

      t.timestamps
    end
  end
end

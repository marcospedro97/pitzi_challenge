# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :postal_code
      t.string :street
      t.integer :number
      t.string :complement
      t.string :neighborhood

      t.timestamps
    end
  end
end

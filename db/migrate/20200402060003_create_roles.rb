# frozen_string_literal: true

class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :name, null: false, unique: true, index: true
      t.string :description

      t.timestamps
    end

    add_index :roles, :created_at
    add_index :roles, :updated_at
  end
end

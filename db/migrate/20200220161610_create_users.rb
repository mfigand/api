class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, index: true
      t.string :lastname, null: false, index: true
      t.string :email, null: false, unique: true, index: true
      t.string :password_digest, null: false, index: true

      t.timestamps
    end

    add_index :users, :created_at
    add_index :users, :updated_at
  end
end

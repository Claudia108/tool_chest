class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :name
      t.text :email
      t.text :user_name
      t.string :password_digest
      t.string :password_confirmation

      t.timestamps null: false
    end
  end
end

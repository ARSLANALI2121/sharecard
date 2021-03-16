class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.string :password_digest
      t.string :password_confirmation
      t.string :first_name
      t.string :last_name
      t.integer :phone_number
      t.string :company
      t.boolean :news_letter
      t.timestamps
    end
  end
end

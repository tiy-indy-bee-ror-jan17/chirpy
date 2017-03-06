class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.text :bio
      t.string :avatar
      t.string :password_digest
      t.string :token
      t.string :email

      t.timestamps
    end
  end
end

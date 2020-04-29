class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :session_token, presence: true
      t.string :email, presence: true
      t.string :password_digest, presence: true
    end

    add_index :users, :email, unique: true 
    add_index :users, :session_token, unique: true
  end
end

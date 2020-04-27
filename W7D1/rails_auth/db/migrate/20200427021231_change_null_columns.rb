class ChangeNullColumns < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :password_digest, true
    change_column_null :users, :session_token, true
  end
end

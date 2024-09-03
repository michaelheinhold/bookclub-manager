class AddNullToUserName < ActiveRecord::Migration[7.2]
  def change
    change_column_null :users, :first_name, false, 1
    change_column_null :users, :last_name, false, 1
  end
end

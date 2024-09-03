class AddNameToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    change_column_null :users, :first_name, false, 1
    change_column_null :users, :last_name, false, 1
  end
end

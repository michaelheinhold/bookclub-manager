class RemoveDefaults < ActiveRecord::Migration[7.2]
  def change
    change_column_default :users, :first_name, nil
    change_column_default :users, :last_name, nil
    change_column_default :users, :email, nil
    change_column_default :users, :encrypted_password, nil
  end
end

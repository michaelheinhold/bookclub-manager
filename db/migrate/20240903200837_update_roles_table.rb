class UpdateRolesTable < ActiveRecord::Migration[7.2]
  def change
    add_column :roles, :name, :string\
  end
end

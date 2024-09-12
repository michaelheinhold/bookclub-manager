class UpdateClubsTable < ActiveRecord::Migration[7.2]
  def change
    add_column :clubs, :name, :string
  end
end

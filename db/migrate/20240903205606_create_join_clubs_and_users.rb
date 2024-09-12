class CreateJoinClubsAndUsers < ActiveRecord::Migration[7.2]
  def change
    create_join_table :clubs, :users do |t|
      t.index :club_id
      t.index :user_id
    end
  end
end

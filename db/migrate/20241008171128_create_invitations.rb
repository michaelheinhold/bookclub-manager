class CreateInvitations < ActiveRecord::Migration[7.2]
  def change
    create_table :invitations do |t|
      t.integer :inviter_id
      t.integer :invitee_id
      t.integer :club_id
      t.boolean :accepted

      t.timestamps
    end
  end
end

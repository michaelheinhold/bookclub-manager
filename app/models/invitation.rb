class Invitation < ApplicationRecord
  belongs_to :club
  belongs_to :inviter, class_name: 'User'
  belongs_to :invitee, class_name: 'User'

  # Optional: Validate that the same invitee cannot be invited multiple times to the same club
  validates :invitee_id, uniqueness: { scope: :club_id, message: "has already been invited to this club" }
end

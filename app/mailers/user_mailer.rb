class UserMailer < ApplicationMailer
  default from: 'michael.heinhold@gmail.com' # Change to your preferred sender email

  def club_invitation(invitation)
    @invitation = invitation
    @inviter = invitation.inviter
    @club = invitation.club
    @invitee = invitation.invitee
    
    mail(to: @invitee.email, subject: "You've been invited to join #{@club.name}!")
  end
end

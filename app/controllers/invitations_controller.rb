class InvitationsController < ApplicationController
  before_action :authenticate_user!

  def accept
    invitation = Invitation.find(params[:id])
    if invitation.invitee == current_user
      # Add the user to the club
      invitation.club.users << current_user
      invitation.update(accepted: true)
      invitation.destroy

      redirect_to invitation.club, notice: "You have joined #{invitation.club.name}."
    else
      redirect_to root_path, alert: "You are not authorized to accept this invitation."
    end
  end
end

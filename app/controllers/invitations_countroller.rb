class InvitationsController < ApplicationController
  before_action :authenticate_user!

  def accept
    invitation = Invitation.find(params[:id])
    if invitation.invitee == current_user
      # Add the user to the club
      invitation.club.users << current_user
      invitation.update(accepted: true)

      redirect_to clubs_path, notice: "You have joined #{invitation.club.name}."
    else
      redirect_to clubs_path, alert: "You are not authorized to accept this invitation."
    end
  end
end

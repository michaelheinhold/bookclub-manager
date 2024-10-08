class ClubsController < ApplicationController
  before_action :set_club, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /clubs or /clubs.json
  def index
    @clubs = Club.all
    @user_clubs = current_user.clubs
  end

  # GET /clubs/1 or /clubs/1.json
  def show
  end

  # GET /clubs/new
  def new
    @club = Club.new
  end

  # GET /clubs/1/edit
  def edit
  end

  # POST /clubs or /clubs.json
  def create
    @club = Club.new(club_params)

    respond_to do |format|
      if @club.save
        current_user.clubs << @club
        format.html { redirect_to club_url(@club), notice: "Club was successfully created." }
        format.json { render :show, status: :created, location: @club }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clubs/1 or /clubs/1.json
  def update
    respond_to do |format|
      if @club.update(club_params)
        format.html { redirect_to club_url(@club), notice: "Club was successfully updated." }
        format.json { render :show, status: :ok, location: @club }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clubs/1 or /clubs/1.json
  def destroy
    @club.destroy!

    respond_to do |format|
      format.html { redirect_to clubs_url, notice: "Club was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # POST /clubs/:id/invite
  def invite
    @club = Club.find(params[:id])
    invitee = User.find_by(email: params[:email])

    if invitee
      # Create an invitation or directly add the user to the club
      invitation = Invitation.create!(inviter: current_user, invitee: invitee, club: @club)
      # Optionally: If you don't want to track invitations, directly add the user
      # @club.users << invitee
      
      # Send the invitation email
      UserMailer.club_invitation(invitation).deliver_now

      redirect_to club_path, notice: "#{invitee.email} has been invited."
    else
      redirect_to club_invite_form_path, alert: "User with that email does not exist."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @club = Club.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def club_params
      params.fetch(:club, {})
      params.require(:club).permit(:name, :user_id => [])
    end
    def require_login
      unless current_user
        redirect_to new_user_session_path
      end
    end
end

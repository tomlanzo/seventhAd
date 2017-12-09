class PlayersController < ApplicationController
before_action :set_player, only: [:edit, :update]
before_action :disable_nav_footer

  def edit; end

  def update
    if @player.update(player_params)
      redirect_to root_path
      PlayerMailer.thanks(@player).deliver_now    #to be reviewed when the flow is linked

    else
      render :edit                   #to be reviewed when the flow is linked
    end
  end

private

   def set_player
    @player = Player.find(params[:id])
   end

   def player_params
    params.require(:player).permit(:name, :email)
   end



end

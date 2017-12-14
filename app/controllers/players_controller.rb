class PlayersController < ApplicationController
before_action :set_player, only: [:edit, :update, :send_player_email]
before_action :disable_nav_footer

  def edit; end

  def update
     if @player.update(player_params)
      redirect_to game_session_path(@player.game_session)
     else
      render :edit
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


class PlayersController < ApplicationController
before_action :set_player, only: [:edit, :update]

  def edit; end

  def update
    if @player.update(player_params)
      redirect_to root_path
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

class PlayersController < ApplicationController
before_action :set_player, only: [:edit, :update]
before_action :disable_nav_footer

  def edit; end

  def update
     if @player.update(player_params)
      redirect_to game_session_path
      send_player_email
           #to be reviewed when the flow is linked
    else
      render :edit                   #to be reviewed when the flow is linked
    end                               #to be reviewed when the flow is linked
  end

private

   def set_player
    @player = Player.find(params[:id])
   end

   def player_params
    params.require(:player).permit(:name, :email)
   end

   def send_player_email
     # redirect + mailer
      if @player.ranking <= 3
        PlayerMailer.congrats(@player).deliver_now
        # envoie du mail congrats
      else 
        PlayerMailer.thanks(@player).deliver_now
        # envoi mail standard
      end
    end
end


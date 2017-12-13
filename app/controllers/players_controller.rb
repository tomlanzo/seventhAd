class PlayersController < ApplicationController
before_action :set_player, only: [:edit, :update, :send_player_email]
before_action :disable_nav_footer

  def edit; end

  def update
     if @player.update(player_params)
      redirect_to game_session_path(@player.game_session)
      # send_player_email
     else
      render :edit
    end
  end

  # def send_player_email
  #   # redirect + mailer
  #    if @player.ranking <= 3
  #      PlayerMailer.congrats(@player).deliver_now
  #      # envoie du mail congrats
  #    else
  #      PlayerMailer.thanks(@player).deliver_now
  #      # envoi mail standard
  #    end
  #  end

private

   def set_player
    @player = Player.find(params[:id])
   end

   def player_params
    params.require(:player).permit(:name, :email)
   end
end


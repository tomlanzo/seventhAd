class PlayersController < ApplicationController
  def index
    #Calculer le score de chaque player
    #afficher le classement
    @game_session = GameSession.find(params[:id])
    @players = @game_session.players
    @players.each do |player|
      calculate_score_player(player)
    end
  end

  private

  # Calculer le score de chaque players
  # Afficher les players par ordre décroissant de score

  def calculate_score_player
    if !player.answers.nil?
      player.answers.each do |answer|
        if answer.correct
          player.score += answer.created_at.to_i
        end
      end
    end
  end
end

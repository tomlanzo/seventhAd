class PlayerMailerPreview < ActionMailer::Preview
  def thanks
    player = Player.first
    PlayerMailer.thanks(player)
  end
end

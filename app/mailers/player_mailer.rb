class PlayerMailer < ApplicationMailer
before_action :attach_logo_inline
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.thanks.subject
  #


  def thanks (player)
    @player = player

    mail to: @player.email, subject: "Merci #{@player.name}"
  end

  def congrats (player)
    @player = player

    mail to: @player.email, subject: "Bravo #{@player.name} !"
  end

  def attach_logo_inline
    logo = Rails.root.join('app', 'assets', 'images', 'Benextlogo.png')
    attachments.inline['Benextlogo.png'] = logo.read
  end
end

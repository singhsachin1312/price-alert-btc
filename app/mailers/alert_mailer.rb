class AlertMailer < ApplicationMailer
  def alert_user(alert)
    @user = alert.user
    @alert = alert
    mail(to: @user.email, subject: 'BTC Price Alert')
    @alert.update(status: 'triggered')
  end
end

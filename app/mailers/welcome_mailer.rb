class WelcomeMailer < ActionMailer::Base
  default from: "info@bandfund.com"
  layout 'mail'

  def fan(fan)
    @fan = fan
    mail(to: @fan.email, subject: "Welcome to BandFund")
  end

  def artist(artist)
    @artist = artist
    mail(to: @artist.email, subject: "Welcome to BandFund")
  end
end

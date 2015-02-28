class WelcomeMailer < ActionMailer::Base
  include Roadie::Rails::Automatic

  default from: "info@bandfund.com"
  layout 'mail'

  def fan(fan)
    @fan = fan
    @template_label = "Fan notificaiton"
    mail(to: @fan.email, subject: "Welcome to BandFund")
  end

  def artist(artist)
    @artist = artist
    @template_label = "Artist notificaiton"
    mail(to: @artist.email, subject: "Welcome to BandFund")
  end
end

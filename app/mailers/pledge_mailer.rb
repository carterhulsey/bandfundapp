class PledgeMailer < ActionMailer::Base
  include Roadie::Rails::Automatic

  default from: "info@bandfund.com"
  layout 'mail'

  def notify_fan(pledge)
    @template_label = "Fan notificaiton"
    @pledge = pledge
    @fan = pledge.fan
    @artist = pledge.artist
    mail(to: @fan.email, subject: "You have pledged $#{@pledge.price}/month to #{@artist.name}")
  end

  def notify_artist(pledge)
    @template_label = "Artist notificaiton"
    @pledge = pledge
    @fan = pledge.fan
    @artist = pledge.artist
    mail(to: @artist.email, subject: "A fan has pledged $#{@pledge.price}/month")
  end

end

class PledgeMailer < ActionMailer::Base
  default from: "info@bandfund.com"
  layout 'mail'

  def notify_fan(pledge)
    @pledge = pledge
    @fan = pledge.fan
    @artist = pledge.artist
    mail(to: @fan.email, subject: "You have pledged $#{@pledge.price}/month to #{@artist.name}")
  end

  def notify_artist(pledge)
    @pledge = pledge
    @fan = pledge.fan
    @artist = pledge.artist
    mail(to: @artist.email, subject: "A fan has pledged $#{@pledge.price}/month")
  end

end

class Pledge < ActiveRecord::Base
  has_many :artist_pledges
  has_many :artists, :through => :artist_pledges
  belongs_to :artist
  belongs_to :fan
  belongs_to :reward

  after_create :send_notifications

  def address
    [self.address1, self.address2, self.city, self.state, self.zip].compact.join(", ")
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def send_notifications
    PledgeMailer.notify_fan(self).deliver
    PledgeMailer.notify_artist(self).deliver
  end
end

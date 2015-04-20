class Fan < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pledges

  after_create :send_welcome_message

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def send_welcome_message
    WelcomeMailer.fan(self).deliver
  end

  def has_pledge_for?(artist)
    self.pledges.where(artist_id: artist.id).any?
  end

  def pledge_for(artist)
    self.pledges.where(artist_id: artist.id).first
  end
end

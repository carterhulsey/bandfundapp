class Artist < ActiveRecord::Base
  belongs_to :genre
  has_many :rewards
  has_many :artist_pledges
  has_many :pledges, :through => :artist_pledges 

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end

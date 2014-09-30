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

  def self.stripe_params(request, user)
    user.update_attributes(access_token: request["access_token"])
    user.update_attributes(stripe_publishable_key: request["stripe_publishable_key"])
    user.update_attributes(stripe_user_id: request["stripe_user_id"])
  end

end

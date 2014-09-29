class Artist < ActiveRecord::Base

  belongs_to :genre
  has_many :rewards

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates :city, :state, :website_url, :name, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end

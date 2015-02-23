class Pledge < ActiveRecord::Base
  has_many :artist_pledges
  has_many :artists, :through => :artist_pledges
  belongs_to :artist
  belongs_to :fan

  def address
    [self.address1, self.address2, self.city, self.state, self.zip].compact.join(", ")
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end

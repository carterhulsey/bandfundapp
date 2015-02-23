class Pledge < ActiveRecord::Base
  has_many :artist_pledges
  has_many :artists, :through => :artist_pledges
  belongs_to :artist
  belongs_to :fan

  def address
    address_parts = [self.address1]
    address_parts << self.address2 if self.address2 && !self.address2.empty?
    address_parts << self.city if self.city && !self.city.empty?
    address_parts << self.state if self.state && !self.state.empty?
    address_parts << self.zip if self.zip && !self.zip.empty?

    address_parts.join(', ')
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end

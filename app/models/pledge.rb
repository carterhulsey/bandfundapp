class Pledge < ActiveRecord::Base
  has_many :artist_pledges
  has_many :artists, :through => :artist_pledges 
end
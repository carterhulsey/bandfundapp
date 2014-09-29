class Pledge < ActiveRecord::Base
  has_many :artists, :through => :artists_pledges 
end
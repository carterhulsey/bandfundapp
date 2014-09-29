class Pledge < ActiveRecord::Base
  has_and_belongs_to_many :artists, :through => :artists_pledges 
end
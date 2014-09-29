class ArtistPledge < ActiveRecord::Base
  belongs_to :artist
  belongs_to :pledge
end
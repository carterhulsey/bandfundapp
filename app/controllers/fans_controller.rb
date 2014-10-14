class FansController < ApplicationController

  def index
    @featured_artist = Artist.find_by(featured: true)
    artist_groups = Artist.pluck(:id).sample(9).in_groups_of(3)
    @artists1 = Artist.where(id: artist_groups[0])
    @artists2 = Artist.where(id: artist_groups[1])
    @artists3 = Artist.where(id: artist_groups[2])
  end
end

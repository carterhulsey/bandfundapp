class FansController < ApplicationController

  def index
    @artists = Artist.all
  end
end
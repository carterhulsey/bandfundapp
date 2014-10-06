class WelcomeController < ApplicationController

  def index
    if current_fan
      redirect_to fans_path 
    end

    if current_artist
      redirect_to artists_path
    end
  end
end

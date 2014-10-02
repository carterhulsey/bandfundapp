class Artists::Devise::SessionsController < Devise::SessionsController
  def new
    @artist = Artist.new
    respond_to do |format|
      format.html
      format.js
    end
  end
end
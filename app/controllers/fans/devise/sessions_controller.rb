class Fans::Devise::SessionsController < Devise::SessionsController
  def new
    @fan = Fan.new
    respond_to do |format|
      format.html
      format.js
    end
  end
end
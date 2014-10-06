class Fans::Devise::SessionsController < Devise::SessionsController
  def new
    @fan = Fan.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def after_sign_in_path_for(resource)
    fan_path(@fan)
  end
end
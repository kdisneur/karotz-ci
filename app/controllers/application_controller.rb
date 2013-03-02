class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def is_admin?
    warden.authenticate!
    unless current_user && current_user.is_admin?
      render file: "#{Rails.root}/public/403.html", status: :forbidden
    end
  end
end

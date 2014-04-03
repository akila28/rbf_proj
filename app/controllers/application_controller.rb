class ApplicationController < ActionController::Base


  protect_from_forgery
def after_sign_in_path_for(user)
  if current_user
    home_index_path
    else
    :root
  end
 end

rescue_from CanCan::AccessDenied do |exception|
  flash[:error] = "Access denied"
  redirect_to root_url
 end 
end

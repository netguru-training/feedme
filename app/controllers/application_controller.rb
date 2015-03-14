class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_admin_user!
    if user_signed_in?
      if current_user.admin
        true
      end
    else
      return redirect_to new_user_session_path
    end
  else
    return redirect_to new_user_session_path
 end
end
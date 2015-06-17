class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_action :authenticate_user!
  # before_action :authenticate_admin!

  # def admin_page!
  #   redirect_to root_url, notice: 'You must be admin to access to this page' if current_user.nil? or not current_user.admin?
  # end

end

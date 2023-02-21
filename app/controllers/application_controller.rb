class ApplicationController < ActionController::Base
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include Pagy::Backend
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :update_allowed_parameters, if: :devise_controller?

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :surname, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys:[:name, :surname, :email, :password, :current_password])
  end
end

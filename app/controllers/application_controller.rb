# Top-level controller for app.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  # Tell Devise to do its job
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Configures Devise Parameters
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[first_name last_name email])
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name email password password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name email password password_confirmation current_password])
  end
end

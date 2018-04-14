class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameter, if: :devise_controller?

  protected

  def configure_permitted_parameter
    device_parameter_sanitizer.permit(:sign_up, key: [:name])
  end
end

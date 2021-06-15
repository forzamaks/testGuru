class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for(resource)
    flash[:notice] = "Welcome! #{current_user.name} #{current_user.last_name}"
    current_user.admin? ? admin_tests_path : root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: [:name, :last_name, :email, :password, :password_confirmation]
    )
  end
end

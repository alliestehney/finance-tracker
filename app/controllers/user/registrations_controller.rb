class User::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_paramater_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_paramater_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

end
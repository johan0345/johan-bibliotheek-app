class ApplicationController < ActionController::Base

  before_action :authenticate_user!, :authenticate_user_using_2fa

  def authenticate_user_using_2fa
    return unless current_user.present?
    return unless session[:need_two_factor_authentication]
    return if current_user.otp_required_for_login?

    redirect_to user_two_factor_authentication_index_path
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :phone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :phone])
  end
end

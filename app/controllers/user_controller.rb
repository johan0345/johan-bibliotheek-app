class UserController < ApplicationController
  before_action :authenticate_user!, except: %i[show_otp verify_otp]

  def show_otp
    @user = current_user
  end

  def verify_otp
    verifier = Rails.application.message.verifier(:otp_session)
    user_id = verifier.verify(session[:otp_token])
    user = User.find(user_id)

    if user.validate_and_consume_otp!(params[:otp_attempt])

end

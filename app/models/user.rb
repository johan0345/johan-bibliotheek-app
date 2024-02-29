class User < ApplicationRecord
  devise :two_factor_authenticatable, :otp_secret_encryption_key => ENV['DEVISE_SECRET_KEY']
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:email]
  enum role: { standard: 0, admin: 1 }


  validates :email, uniqueness: true

  validate :email_domain

  private

  def email_domain
    domain = email.split("@").last
    errors.add(:email, "is not from a permitted domain.") unless domain == 'lemone.com'
  end

end

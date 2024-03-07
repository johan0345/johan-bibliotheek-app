class User < ApplicationRecord
  devise :two_factor_authenticatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :registerable, :recoverable, :rememberable, :validatable, :authentication_keys => [:email]
  enum role: { standard: 0, admin: 1 }

  has_one_attached :avatar
  after_commit :add_default_avatar, on: %i[create update]

  validates :email, uniqueness: true

  validate :email_domain

  def avatar_thumbnail
    if avatar.attached?
    avatar.variant(resize_to_limit: [100, nil]).processed
    else
      '/default-pfp.webp'
    end
  end

  private

  def email_domain
    domain = email.split("@").last
    errors.add(:email, "is not from a permitted domain.") unless domain == 'lemone.com'
  end

  def add_default_avatar
    unless avatar.attached?
      avatar.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'default-pfp.webp'
            )
          ), 
          filename: 'default-pfp.webp', 
          content_type: 'image/webp'
        )
    end
  end
end

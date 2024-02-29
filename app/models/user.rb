class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:username, :email, :phone]
  enum role: { standard: 0, admin: 1 }

  validates :username, uniqueness: true
  validates :email, uniqueness: true
  validates :phone, uniqueness: true



end

class BookPost < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :genre, presence: true
  validates :isbn, presence: true, uniqueness: true, format: { with: /\A[\d-]+\z/, message: "only allows numbers and hyphens" }

  scope :sorted, ->{ order(published_at: :desc, updated_at: :desc) } 

  belongs_to :user

end

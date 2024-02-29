class BookPost < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :genre, presence: true
  validates :isbn, presence: true, uniqueness: true

  scope :sorted, ->{ order(published_at: :desc, updated_at: :desc) } 

end

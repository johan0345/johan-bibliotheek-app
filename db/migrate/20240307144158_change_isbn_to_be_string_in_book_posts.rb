class ChangeIsbnToBeStringInBookPosts < ActiveRecord::Migration[7.1]
  def change
    change_column :book_posts, :isbn, :string
  end
end

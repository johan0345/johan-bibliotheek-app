class AddUserIdToBookPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :book_posts, :user_id, :integer
  end
end

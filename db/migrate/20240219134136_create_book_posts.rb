class CreateBookPosts < ActiveRecord::Migration[7.1]
  def change
    create_table :book_posts do |t|
      t.string :title
      t.string :author
      t.string :genre
      t.string :isbn

      t.timestamps
    end
  end
end

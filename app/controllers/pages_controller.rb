class PagesController < ApplicationController
  def index
    if params[:order] == "asc"
      @book_posts = BookPost.order("LOWER(title) asc")
    elsif params[:order] == "desc"
      @book_posts = BookPost.order("LOWER(title) desc")
    else
      @book_posts = BookPost.all
    end
  end
end
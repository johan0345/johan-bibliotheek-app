class BookPostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_book_post, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]

  def show
  end
  
  def index
    @book_posts = BookPost.all
  end

  def new
    @book_post = BookPost.new
  end

  def create
    @book_post = current_user.book_posts.build(book_post_params)
    if @book_post.save
      redirect_to @book_post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @book_post.update(book_post_params)
      redirect_to @book_post
    else
      render :edit, status: :unprocessable_entity
  end
end

  def destroy
    @book_post.destroy
    redirect_to root_path
  end

  private

  def book_post_params
    params.require(:book_post).permit(:title, :author, :genre, :isbn)
  end

  def set_book_post
    @book_post = BookPost.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def check_user
    unless @book_post.user_id == current_user.id
      redirect_to root_path
    end
  end
end
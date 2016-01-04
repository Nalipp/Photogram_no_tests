class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    if @post = Post.create(post_params)
      flash[:success] = "Your post has been created!"
      redirect_to posts_path
    else
      flash.now[:alert] = "Unable to create post, please check the form."
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post has been updated."
      redirect_to post_path
    else
      flash.now[:alert] = "Unable to update post. Please check the form."
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(:image, :caption)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end

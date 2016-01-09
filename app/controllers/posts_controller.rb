class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!
  before_action :owned_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
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
      params.require(:post).permit(:caption, :image)
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def owned_post
      unless current_user == @post.user
        flash[:alert] = "That post dosen't belong to you!"
        redirect_to root_path
      end
    end
end

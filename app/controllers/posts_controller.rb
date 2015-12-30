class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def show
  end

  def create
    @post = Post.create( user_params )
  end

  private
    def user_params
      params.require(:post).permit(:avatar)
    end
end

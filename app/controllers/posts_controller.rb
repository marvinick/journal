class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(post_params)
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :url)
  end
end

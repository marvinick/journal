class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = User.first

    if @post.save
      flash[:notice] = "Your journal was saved"
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit

  end

  def update

    if @post.update(post_params)
      flash[:notice] = "This entry was updated"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :url)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end

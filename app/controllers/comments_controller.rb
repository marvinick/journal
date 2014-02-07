class CommentsController < ApplicationController
  before_action :require_user


  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params) #build does not hit the database
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Your comment was added"
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
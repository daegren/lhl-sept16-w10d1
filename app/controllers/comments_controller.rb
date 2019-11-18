class CommentsController < ApplicationController
  before_action :set_post, only: [:create]

  def create
    comment = @post.comments.build(comment_params)

    if comment.save
      redirect_to post_path(params[:post_id]), notice: 'Comment created!'
    else
      redirect_to post_path(params[:post_id]), notice: 'Something went wrong!'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    post.comments.create!(user: current_user, body: comment_params[:body])
    redirect_to post, notice: 'Comment saved'
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
class CommentsController < ApplicationController
  def index
    @comments = Comment.where(post_id: params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @new_comment = Comment.new(
      text: comment_params,
      post_id: params[:post_id],
      user_id: current_user.id
    )
    @new_comment.update_comments_counter
    if @new_comment.save
      redirect_to user_posts_path, notice: 'Success!'
    else
      render :new, alert: 'Error occured!'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to "/users/#{params[:user_id]}/posts/#{params[:post_id]}"
  end

  private

  def comment_params
    params.require(:comment).permit(:text)[:text]
  end
end

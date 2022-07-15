class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find_by(user_id: @user.id, id: params[:id])
    @comments = @post.recent_comments
  end
end

class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @posts = @user.posts
    @commmnts = Comment.find(params[:post_id])
  end
end

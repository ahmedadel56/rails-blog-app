class PostsController < ApplicationController
  def index
    @user = User.includes(posts: [comments: [:user]]).find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.includes(comments:[:user]).find_by(user_id: @user.id, id: params[:id])
    @comments = @post.recent_comments
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @new_post = current_user.posts.new(post_params)
    @new_post.update_posts_counter
    if @new_post.save
      redirect_to user_posts_path, notice: 'succeded'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:data).permit(:title, :text)
  end
end

class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(comments: [:user]).where(user_id: params[:user_id])
    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.includes(comments: [:user]).find_by(user_id: @user.id, id: params[:id])
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
      redirect_to root_path, notice: 'succeded'
    else
      render :new
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.destroy
      redirect_to root_path, notice: 'succeded'
    else
      flash.now[:notice] = 'error'
    end
  end

  private

  def post_params
    params.require(:data).permit(:title, :text)
  end
end

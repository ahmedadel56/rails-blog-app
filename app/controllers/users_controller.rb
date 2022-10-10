class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.includes(image_attachment: :blob).all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.last_three_posts
  end
end

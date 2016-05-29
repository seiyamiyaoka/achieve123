class UsersController < ApplicationController
  before_action only: [:show, :following, :followers]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def following
    @user = User.find(params[:id])
    @users = @user.followed_users
    render 'show_follow'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end

  private

  def user_params
    params.require(:user).permit(:name, :description, :image_url)
  end

  def set_user
    @user = User.find_by(params[:id])
  end
end

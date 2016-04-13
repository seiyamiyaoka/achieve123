class UsersController < ApplicationController
  before_action only:[:show, :followed, :followers]
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(params[:id])
  end

  def followed
    @users = @user.follwed_users
    render 'show_follow'
  end

  def followers
    @users = @user.follwers_users
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

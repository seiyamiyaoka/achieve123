class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(params[:id])
    @note = @user.like_notes
    @title = "いいね一覧"

  end
  def like_notes
    @user = User.find_by(params[:id])
    @note = @user.like_notes

    render :show
  end
  def update
    @user = User.find(params[:id])
    @user.update
    render :index
  end
  private
  def params_id
    params.require(:user).permit(:provider,:user_id,)
  end
end

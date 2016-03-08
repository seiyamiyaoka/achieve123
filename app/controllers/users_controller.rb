class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
     = User.find_by(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:name, :description, :image_url)
    end
end

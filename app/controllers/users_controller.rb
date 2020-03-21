class UsersController < ApplicationController
  def index
  	@users = User.all
    @user = User.find(params[:id])
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
    @user = current_user
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :video, :mediainfo, :user_id)
    end

    def user_params
      params.require(:user).permit(:name, :email, :introduction, :user_image)
    end
end

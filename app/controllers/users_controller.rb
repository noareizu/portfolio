class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  end

  private
    def article_params
      params.require(:article).permit(:title, :video, :mediainfo, :user_id)
    end

    def user_params
      params.require(:user).permit(:name)
    end
end

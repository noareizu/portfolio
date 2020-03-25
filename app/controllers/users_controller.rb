class UsersController < ApplicationController
  def index
  	@users = User.all
    @user = User.find(params[:id])
  end

  def show
  	@user = User.find(params[:id])
    @articles = Article.all.page(params[:page]).per(16)
    @article = @user.articles
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  def likes
    @user = User.find(params[:id])
    @likes = Like.where(user_id: @user.id)
  end

  def following
    #@userがフォローしているユーザー
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    #@userをフォローしているユーザー
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  private
    def article_params
      params.require(:article).permit(:title, :video, :mediainfo, :user_id, :article_image)
    end

    def user_params
      params.require(:user).permit(:name, :email, :introduction, :user_image)
    end

    def likes_params
      params.require(:likes).permit(:user_image, :article_image)
    end
end

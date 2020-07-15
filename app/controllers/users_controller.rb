class UsersController < ApplicationController
  def index
    if  current_user.admin == true
    	@users = User.all
      @user = User.page(params[:page]).per(20)
    else
      redirect_to root_path
    end
  end

  def show
  	@user = User.find(params[:id])
    @articles = Article.all
    @article = @user.articles.page(params[:page]).per(12)
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update!(user_params)
    redirect_to user_path
  end

  def destroy
    @user = User.find(params[:id])
    if @user == current_user or @user.admin == false
      @user.destroy
    end
    redirect_to users_path
  end

  def likes
    @user = User.find(params[:id])
    @likes = Like.where(user_id: @user.id).page(params[:page]).per(12)
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

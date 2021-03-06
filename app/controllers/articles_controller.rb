class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def top
    @articles = Article.page(params[:page]).per(12)
    @users = User.all
    @user = current_user
  end

  def search
    @articles = Article.search(params[:keyword]).page(params[:page]).per(12)
    @users = User.all
    @user = current_user
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @users = User.all
    @article = Article.find(params[:id])
    @user = @article.user
    @comment = Comment.new
    @comments = @article.comments.includes(:user)
  end

  # GET /articles/new
  def new
    @article = Article.new
    @user = current_user
  end

  # GET /articles/1/edit
  def edit
    @users = User.all
    @user = current_user
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :video, :mediainfo,:article_image,:user_id)
    end

    def user_params
      params.require(:user).permit(:name,:user_image)
    end
end

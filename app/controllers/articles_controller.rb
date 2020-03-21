class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def top
    @articles = Article.all
    @users = User.all
    @user = current_user
  end

  def index
    @articles = Article.all
    @users = User.all
    @user = User.find(params[:id])
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @users = User.all
    @user = current_user
    @article = Article.find(params[:id])
    @comments = @article.comments
    @comment = Comment.new
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
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
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
      params.require(:article).permit(:title, :video, :mediainfo, :user_id)
    end

    def user_params
      params.require(:user).permit(:name,:user_image)
    end
end

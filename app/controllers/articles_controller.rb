class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [new, :create, :edit, :update, :destroy]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @pagy, @articles = pagy(Article.ordered, items: 10)
  end

  def show; end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save!
     redirect_to @article, notice: "article is saved"
     else
      render :new, alert: @article.errors.full_messages
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, alert: @article.errors.full_messages
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private
  def set_article
    @article = Article.find_by(id: params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end

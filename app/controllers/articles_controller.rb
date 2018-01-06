class ArticlesController < ApplicationController
  before_action :auth_user, except: [:show]
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all.page(params[:page] || 1).
      per_page(params[:per_page] || 10).order('id desc')
  end

  def show
    @article.view_count += 1
    @article.save!
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.view_count = 0
    @article.content_html = markdown(@article.content)
    if @article.save
      flash[:info] = "文章发布成功！"
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update_attributes(article_params)
      flash[:success] = "update article successful"
      redirect_to @article
    else
      render 'deit'
    end
  end

  def destroy
    if @article.destroy
      flash[:notice] = "删除成功"
      redirect_to articles_path
    else
      flash[:notice] = "删除失败"
      redirect_back fallback_location: articles_path
    end
  end

  def preview
    content = markdown(params[:content])
    render html: content
  end

  private
  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :category_id, :content)
  end

end

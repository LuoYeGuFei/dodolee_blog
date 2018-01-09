class CommentsController < ApplicationController

  layout false
  before_action :auth_user
  before_action :find_article

  def index
    @comments = @article.comments
  end

  def create
    @comment = @article.comments.new
    @comment.content = params[:content]
    @comment.user_id = current_user.id
    @comment.content_html = markdown(@comment.content)
    @comment.comment_at = Time.now 

    if @comment.save
      @comments = @article.reload.comments
      render json: {
        status: 'ok',
        data: render_to_string(file: 'comments/index')
      }
    else
      render json: {
        status: 'error',
        data: render_to_string(file: 'comments/new')
      }
    end
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    @comments = @article.comments

    redirect_to article_path(@article)
  end


  private
  def find_article
    @article = Article.find(params[:article_id])
  end

end

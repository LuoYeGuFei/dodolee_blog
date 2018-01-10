class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  protected
  def auth_user
    unless logged_in?
      flash[:notice] = "请登录"
      redirect_to new_session_path
    end
  end

  def markdown content
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
    markdown = Redcarpet::Markdown.new(
      renderer,
      fenced_code_blocks: true,
      autolink: true,
      tables: true)
    markdown.render(content).html_safe
  end

end

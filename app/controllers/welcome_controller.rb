class WelcomeController < ApplicationController

  def index
    @articles = Article.all.page(params[:page] || 1).
      per_page(params[:per_page] || 10).order('id desc')
  end

  def about
    @resume = User.first.resume
  end

  def download_resume
    @resume = User.first.resume
    content = @resume.content_html.nil? ? @resume.content : @resume.content_html
    kit = PDFKit.new(content, page_size: 'Letter')
    pdf = kit.to_pdf
    file_name = "李亚中的个人简历.pdf"
    send_data(pdf, filename: file_name)
  end

end

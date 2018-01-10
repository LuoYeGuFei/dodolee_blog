class ResumesController < ApplicationController
  def edit
    @resume = current_user.resume
  end

  def update
    @resume = current_user.resume
    @resume.attributes = params.require(:resume).permit(:title, :content)
    @resume.content_html = markdown(params[:resume][:content])
    if @resume.save
      redirect_to about_path
    else
      render action: :edit
    end
  end

end

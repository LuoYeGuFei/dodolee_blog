class UsersController < ApplicationController

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user)
      .permit(:email, :password, :password_confirmation))

    if @user.save
      Resume.create!(user_id: @user.id, title: "#{@user.username}的简历", content: "内容" )
      flash[:notice] = "注册成功，请登录"
      redirect_to new_session_path
    else
      render action: :new
    end
  end


end

class SettingsController < ApplicationController

  before_action :auth_user
  before_action :get_user

  def show
  end

  def profile
  end

  def reward
  end

  def password
  end

  def update
    case params[:edit_path]
    when "profile"
      update_profile
    when "reward"
      update_reward
    when "password"
      update_password
    else
      update_basic
    end
  end

  private
  def get_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(
      :name, :introduction, :avatar, :city, :company,:alipay, 
      :github, :homepage, :current_password, :password, :wechat,
      :password_confirmation, :signature, :edit_path)
  end

  def update_basic
    if @user.update(user_params)
      redirect_to setting_path, notice: "更新成功！"
    else
      render "show"
    end
  end

  def update_profile
    if @user.update(user_params)
      redirect_to profile_setting_path, notice: "更新成功！"
    else
      render "profile"
    end
  end

  def update_password
    if @user.valid_password?(params[:user][:current_password])
      @user.password_confirmation = params[:user][:password_confirmation]

      if @user.change_password!(params[:user][:password])
        redirect_to new_session_path, notice: "密码更新成功，请重新登录！"
      else
        render "password"
      end
    else
      @user.errors.add :current_password, "当前密码不正确"
      render "password"
    end
  end

end

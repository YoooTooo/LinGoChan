class UsersController < ApplicationController
before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :show]
before_action :correct_user,   only: [:edit, :update]
before_action :admin_user,     only: [:destroy]

  def new
    @user = User.new
  end

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @subject_posts = @user.subject_posts.all.page(params[:page]).per(10)
    @reply_posts = @user.reply_posts.all.page(params[:page]).per(10)
    @feedback_posts = @user.feedback_posts.all.page(params[:page]).per(10)
    @tag = Tag.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "アカウントの認証メールを送信しました！"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "プロフィールを更新しました！"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation,
                                   :self_introduction)
    end

# 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end

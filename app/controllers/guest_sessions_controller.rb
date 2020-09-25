class GuestSessionsController < ApplicationController

  def create
    if user = User.find(999)
      log_in(user)
      redirect_to user_path(user)
    else
      user = User.create(id:999 ,name: 'りんごちゃん', email: 'easy_login@example.com')
      log_in_as_guset(user) #application_controller.rbに記述してる。
      flash[:success] = 'ゲストユーザーでログインしました'
      redirect_to user_path(user)
    end
  end
end

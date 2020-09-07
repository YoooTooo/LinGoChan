class GuestSessionsController < ApplicationController

  def create
    user = User.create(id:999 ,name: 'りんごちゃん', email: 'easy_login@example.com')
    log_in_as_guset(user)
    flash[:success] = 'ゲストユーザーでログインしました'
    redirect_to user_path(user)
  end
end
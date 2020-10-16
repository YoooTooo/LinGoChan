class GuestSessionsController < ApplicationController

  def create
     user = User.find_or_create_by(email: 'example0@stayhome.li')
     user.name = "りんごちゃん"
     user.password = "lingochan"
     user.save if !user.id #idがない場合、DBに保存してIDを生成
     log_in_as_guset(user)
     redirect_to user_path(user)
     flash[:success] = 'ゲストユーザーでログインしました'
  end
end

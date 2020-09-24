class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

private
# ユーザーのログインを確認する
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてくさい"
        redirect_to login_url
      end
    end

#ログインユーザー用のログイン
    def log_in_as_guset(user)
    if user.activated = false
      user.authenticated?(:activation, params[:id])
      user.activate
    end
      log_in(user)
    end
end

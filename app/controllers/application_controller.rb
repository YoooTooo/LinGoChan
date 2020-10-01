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

    def log_in_as_guset(user)
      user.authenticated?(:activation, params[:id])
      user.activate
      log_in(user)
    end

    # 管理者かどうか確認
        def admin_user
          redirect_to(root_url) unless current_user.admin?
        end
end

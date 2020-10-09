require 'rails_helper'

RSpec.describe "Remember me", type: :system do
  let(:user) { FactoryBot.create(:user) }

  # ログアウト系のバグのテスト
  context "with valid information" do
    # ログイン中のみログアウトすること
    it "logs in with valid information followed by logout" do
      visit login_path

      fill_in "session_email", with: user.email
      fill_in "session_password", with: user.password
      click_button 'ログインする！'

      expect(current_path).to eq (user_path(user))

      # ログアウトする
      delete logout_path
      expect(response).to redirect_to root_path
      expect(session[:user_id]).to eq nil

      # 2番目のウィンドウでログアウトする
      delete logout_path
      expect(response).to redirect_to root_path
      expect(session[:user_id]).to eq nil
    end
  end
end

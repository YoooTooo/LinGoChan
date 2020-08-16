require 'rails_helper'

RSpec.describe "Remember me", type: :request do
  let(:user) { FactoryBot.create(:user) }

  # ログアウト系のバグのテスト
  context "with valid information" do
    # ログイン中のみログアウトすること
    it "logs in with valid information followed by logout" do
      sign_in_as(user)
      expect(response).to redirect_to user_path(user)

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

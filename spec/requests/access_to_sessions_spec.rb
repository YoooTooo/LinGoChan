require 'rails_helper'
require 'pp'


RSpec.describe 'access to sessions', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:other_user) { FactoryBot.create(:other_user) }

  # ログインに成功
  it "user successfully login" do
    sign_in_as user
    expect(response).to redirect_to user_path(user)
  end

  # 無効な情報ではログインに失敗
  it "user doesn't login with invalid information" do
    visit login_path
    fill_in "メールアドレス", with: ""
    fill_in "パスワード", with: ""
    click_button "ログインする！"

    expect(current_path).to eq login_path
    page.has_content? ("メールアドレスかパスワードが正しくありません。")
  end

describe 'DELETE #destroy' do
  it 'log out and redirect to root page' do
    delete logout_path
    expect(response).to redirect_to root_path
    #セッションの値のテスト
    expect(is_logged_in?).to be_falsey

    #もう一回ログアウトしてみる！
    delete logout_path
    follow_redirect!

    expect(response).to have_http_status(200)
  end
end

end

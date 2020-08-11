require 'rails_helper'

RSpec.describe 'access to sessions', type: :request do
  let!(:user) { create(:user) }
  describe 'POST #create' do
    it 'log in and redirect to detail page' do
      post login_path, params: { session: { email: user.email,
                                            password: user.password } }
      expect(response).to redirect_to user_path(user)
      expect(is_logged_in?).to be_truthy
    end
  end
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

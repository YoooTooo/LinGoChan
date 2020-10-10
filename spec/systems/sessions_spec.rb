require 'rails_helper'

RSpec.describe 'Sessions', type: :system do
  before do
    visit login_path
  end

  #ログイン成功
  describe 'enter an valid values' do
    let(:user) { FactoryBot.create(:user) }
    before do
      fill_in "session_email", with: user.email
      fill_in "session_password", with: user.password
      click_button 'ログインする！'
    end

    subject { page }

    #ログインしたときのページのレイアウトの確認
    it 'log in' do
      is_expected.to have_current_path user_path(user)
      is_expected.to_not have_link nil, href: login_path
      is_expected.to have_text('ユーザー')
      is_expected.to have_text('投稿')
      is_expected.to have_text('アカウント')
    end

    it 'log out after log in' do
      click_on 'ログアウト'
      is_expected.to have_current_path root_path
      is_expected.to have_link 'ログイン', href: login_path
      is_expected.to_not have_link 'アカウント'
      is_expected.to_not have_link nil, href: logout_path
      is_expected.to_not have_link nil, href: user_path(user)
    end
  end

  #ログイン失敗
  #無効な値を入力する
  describe 'enter an invalid values' do
    before do
      fill_in 'メールアドレス', with: ''
      fill_in 'パスワード', with: ''
      click_on 'ログインする！'
    end
    subject { page }
    #フラッシュメッセージが出る
    it 'gets an flash messages' do
      is_expected.to have_content ('メールアドレスかパスワードが正しくありません')
      is_expected.to have_current_path login_path
    end
    #違うページにアクセスしたとき
    context 'access to other page' do
      before { visit root_path }
      #フラッシュメッセージが消える
      it 'is flash disappear' do
        is_expected.to_not have_selector('.alert-danger', text: 'メールアドレスかパスワードが正しくありません')
      end
    end
  end
end

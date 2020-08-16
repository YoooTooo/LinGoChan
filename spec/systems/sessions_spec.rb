require 'rails_helper'

RSpec.describe 'Sessions', type: :system do
  before do
    visit login_path
  end

  #ログイン成功
  describe 'enter an valid values' do
    let(:user) { FactoryBot.create(:user) }
    before do
      sign_in_as(user)
    end
    subject { page }
    #ログインしたときのページのレイアウトの確認
    it 'log in' do
      is_expected.to have_current_path user_path(user)
      is_expected.to_not have_link nil, href: login_path
      #↓ドロップダウン部分のクリック
      click_link 'アカウント'
      is_expected.to have_link 'プロフィール', href: user_path(user)
      is_expected.to have_link 'ログアウト', href: logout_path
    end

    it 'log out after log in' do
      click_link 'アカウント'
      click_link 'ログアウト'
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
      click_button 'ログイン'
    end
    subject { page }
    #フラッシュメッセージが出る
    it 'gets an flash messages' do
      is_expected.to have_selector('.alert-danger', text: 'メールアドレスかパスワードが正しくありません')
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
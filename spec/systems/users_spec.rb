require 'rails_helper'

RSpec.describe 'users', type: :system do
  describe 'user create a new account' do
    #有効な値が入力されたとき
    context 'enter an valid values' do
      before do
        visit signup_path
        fill_in '名前', with: 'testuser'
        fill_in 'メールアドレス', with: 'testuser@example.com'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワードをもう一度入れてください', with: 'password'
        click_button 'アカウントを作成する！'
      end
      #フラッシュメッセージが出る
      it 'gets an flash message' do
        expect(page).to have_selector('.alert-success', text: 'LinGoChanへようこそ！')
      end
    end
    #無効な値が入力されたとき
    context 'enter an invalid values' do
      before do
        visit signup_path
        fill_in '名前', with: ''
        fill_in 'メールアドレス', with: ''
        fill_in 'パスワード', with: ''
        fill_in 'パスワードをもう一度入れてください', with: ''
        click_button 'アカウントを作成する！'
      end
      subject { page }
      #エラーの検証
      it 'gets an errors' do
        is_expected.to have_selector('#error_explanation')
        #is_expected.to have_selector('.alert-danger', text: 'The form contains 6 errors.')
        is_expected.to have_content("パスワードを入力してください", count: 2)
      end
      #今いるページのURLの検証
      it 'render to /signup url' do
        is_expected.to have_current_path '/signup'
      end
    end
  end
end

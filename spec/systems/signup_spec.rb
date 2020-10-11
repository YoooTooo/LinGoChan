require 'pry'
require 'rails_helper'


RSpec.describe 'signup', type: :system do

  describe 'POST #create for user' do

    scenario 'correct page?' do
      visit signup_path
      expect(page).to have_http_status 200
      expect(page).to have_selector 'h1', text: 'ユーザー登録'
    end

      #サインアップの成功
    context 'valid request' do
        #フォームに記述する
      before 'adds a user' do
        user = {
          name: 'test',
          email: 'test@example.com',
          password: 'password',
          password_confirmation: 'password'
        }

          visit signup_path
          fill_in 'user[name]', with: user[:name]
          fill_in 'user[email]', with: user[:email]
          fill_in 'user[password]', with: user[:password]
          fill_in "user[password_confirmation]", with: user[:password_confirmation]
      end

        #ユーザーを作成する！を押下したらユーザーが増える。commitはボタンのname
      it 'should create a user' do
        expect{ click_on 'commit' }.to change(User, :count).by(1)
        expect(page).to have_text('アカウントの認証メールを送信しました！')
      end
    end
  end

      #無効なリクエストを送信
      context 'invalid request' do
        #無効なデータをフォームに記述する
      before 'adds a user' do
          visit signup_path
          fill_in 'user[name]', with: ''
          fill_in 'user[email]', with: ''
          fill_in 'user[password]', with: 'tanakatanaka'
          fill_in "user[password_confirmation]", with: ""
      end
        #ユーザーが追加されないときのテスト
        it 'should create a user' do
          expect{ click_on 'commit' }.to change(User, :count).by(0)
          expect(page).to have_text('名前を入力してください')
          expect(page).to have_text('メールアドレスを入力してください')
          expect(page).to have_text('メールアドレスは不正な値です')
          expect(page).to have_text('Password confirmationとパスワードの入力が一致しません')
        end
      end
end

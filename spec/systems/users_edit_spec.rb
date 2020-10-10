require 'rails_helper'
require 'pry'

RSpec.describe "Edit", type: :system do
  let(:user) { FactoryBot.create(:user) }

  before do
      @edit = {
        name: 'edit',
        email: 'edit@example.com',
        password: 'editpassword',
        password_confirmation: 'editpassword',
        self_introduction: '国籍：　日本人,　日本語レベル：　ネイティブレベル'
      }

      visit login_path
      fill_in "session_email", with: user.email
      fill_in "session_password", with: user.password
      click_button 'ログインする！'

      visit user_path(user)

      click_on ('プロフィールの設定')
    end

  # 編集に成功
  scenario "successful edit" do
    expect(current_path).to eq (edit_user_path(user))
    fill_in "user[name]", with: @edit[:name]
    fill_in "user[email]", with: @edit[:email]
    fill_in "user[password_confirmation]", with: @edit[:password_confirmation]
    fill_in 'user[self_introduction]', with: @edit[:self_introduction]
    fill_in "user[password]", with: @edit[:password]

    click_on "保存する！"

    expect(current_path).to eq user_path(user)
    expect(user.reload.email).to eq @edit[:email]
    expect(user.reload.self_introduction).to eq @edit[:self_introduction]
    expect(user.reload.name).to eq @edit[:name]

  #再設定した情報でログインを試みる
    visit login_path

    fill_in "session_email", with: @edit[:email]
    fill_in "session_password", with: @edit[:password]
    click_button 'ログインする！'

    expect(current_path).to eq (user_path(user))
    expect(page).to have_content(@edit[:name])
  end



  # 編集に失敗
  scenario "unsuccessful edit because of too short password" do

    fill_in "メールアドレス", with: "hog@invalid"
    fill_in "パスワード", with: "hog", match: :first
    fill_in "パスワードをもう一度入れてください", with: "hog"
    click_button "保存する！"

    expect(user.reload.email).to_not eq "hog@invalid"
  end

  scenario "unsuccessful edit because of unmatch between pass and conf" do

    fill_in "メールアドレス", with: "hogehoge@invalid"
    fill_in "パスワード", with: "hogehoge", match: :first
    fill_in "パスワードをもう一度入れてください", with: "hagehage"
    click_button "保存する！"

    expect(user.reload.email).to_not eq "hogehoge@invalid"
  end

end

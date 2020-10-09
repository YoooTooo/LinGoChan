require 'rails_helper'
require 'pry'

RSpec.describe "Edit", type: :system do
  let(:user) { FactoryBot.create(:user) }

  # 編集に成功
  scenario "successful edit" do
    visit login_path

    fill_in "session_email", with: user.email
    fill_in "session_password", with: user.password
    click_button 'ログインする！'

    visit user_path(user)
    expect(current_path).to eq (user_path(user))

    click_on('プロフィールの設定')

    fill_in "user[email]", with: "edit@example.com"
    fill_in "user[email]", with: "testpass"
    fill_in "user[password_confirmation]", with: "testpass"
    fill_in 'user[self_introduction]', with: '国籍：　日本人,　日本語レベル：　ネイティブレベル'

    click_button "保存する！"

    expect(current_path).to eq user_path(user)
    expect(user.reload.email).to eq "edit@example.com"
    expect(user.reload.password).to eq "testpass"
  end

  # 編集に失敗
  scenario "unsuccessful edit because of too short password" do

    visit login_path
    fill_in "session_email", with: user.email
    fill_in "session_password", with: user.password
    click_button 'ログインする！'

    visit user_path(user)

    click_on ('プロフィールの設定')

    fill_in "メールアドレス", with: "hog@invalid"
    fill_in "パスワード", with: "hog", match: :first
    fill_in "パスワードをもう一度入れてください", with: "hog"
    click_button "保存する！"

    expect(user.reload.email).to_not eq "hog@invalid"
  end

  scenario "unsuccessful edit because of unmatch between pass and conf" do

    visit login_path
    fill_in "session_email", with: user.email
    fill_in "session_password", with: user.password
    click_button 'ログインする！'

    visit user_path(user)

    click_on ('プロフィールの設定')

    fill_in "メールアドレス", with: "hogehoge@invalid"
    fill_in "パスワード", with: "hogehoge", match: :first
    fill_in "パスワードをもう一度入れてください", with: "hagehage"
    click_button "保存する！"

    expect(user.reload.email).to_not eq "hogehoge@invalid"
  end

end

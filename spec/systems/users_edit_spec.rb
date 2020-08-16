require 'rails_helper'

RSpec.feature "Edit", type: :feature do
  let(:user) { FactoryBot.create(:user) }

  # 編集に成功
  scenario "successful edit" do
    sign_in_as user
    visit user_path(user)
    click_link "プロフィールの設定"

    fill_in "メールアドレス", with: "edit@example.com"
    # fill_in "パスワード", with: user.password, match: :first
    # fill_in "パスワードをもう一度入れてください", with: "test123", match: :first
    click_button "保存する！"

    expect(current_path).to eq user_path(user)
    expect(user.reload.email).to eq "edit@example.com"
    # expect(user.reload.password).to eq "test123"
  end

  # ユーザーは編集に失敗する
  scenario "unsuccessful edit" do
    sign_in_as user
    visit user_path(user)
    click_link "プロフィールの設定"

    fill_in "メールアドレス", with: "foo@invalid"
    fill_in "パスワード", with: "foo", match: :first
    fill_in "パスワードをもう一度入れてください", with: "bar"
    click_button "保存する！"

    expect(user.reload.email).to_not eq "foo@invalid"
  end

end

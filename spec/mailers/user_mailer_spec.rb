require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  let(:user) { FactoryBot.create(:user) }

  describe "account_activation" do
    let(:mail) { UserMailer.account_activation(user) }

    # メール送信のテスト
    it "renders the headers" do
      expect(mail.to).to eq [user.email]
      expect(mail.from).to eq ["noreply@gmail.com"]
      expect(mail.subject).to eq "アカウントの認証"
    end
  end

  describe "password_reset" do
    let(:mail) { UserMailer.password_reset(user) }

    # メール送信のテスト
      it "renders the headers" do
        user.reset_token = User.new_token
        expect(mail.to).to eq [user.email]
        expect(mail.from).to eq ["noreply@gmail.com"]
        expect(mail.subject).to eq "パスワードのリセット"
      end
  end

end

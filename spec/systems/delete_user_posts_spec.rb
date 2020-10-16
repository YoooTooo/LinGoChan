require 'rails_helper'
require 'pry'

RSpec.describe "administrator's move", type: :system do
  let(:administrator) { FactoryBot.create(:administrator) }
  let(:subject_post) { FactoryBot.create(:subject_post) }

  before :each do
    user1 = User.create(name: "user1", email:"user1@example.com", password:"user1passw")
    @subject_post = SubjectPost.create(user_id:user1.id,  img: "xxxxxxxxxxxxx.png")
    @reply_post = ReplyPost.create(user_id:user1.id, subject_post_id:@subject_post.id, content: "りんごちゃん")
    @feedback_post = FeedbackPost.create(content: "みかんちゃんですね")
    log_in(administrator)
  end

  #admin trueのユーザーにおいて

  #==========ユーザーを削除==========
  context "delete user successfully" do

    before "visit user path" do
      visit "users"
      expect(current_path).to eq "/users"
    end

    #削除を押下したらユーザーが消える。
    it 'should delete a user' do
    expect(page).to have_button('削除')
    expect{ click_on '削除' }.to change(User, :count).by(-1)
    end
  end

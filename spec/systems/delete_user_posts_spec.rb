require 'rails_helper'
require 'pry'

RSpec.describe "administrator's move", type: :system do
  let(:administrator) { FactoryBot.create(:administrator) }
  let(:subject_post) { FactoryBot.create(:subject_post) }

  before :each do
    user1 = User.create(id:1, name: "user1", email:"user1@example.com", password:"user1passw")
    @subject_post = SubjectPost.create(id:1, user_id:1,  img: "xxxxxxxxxxxxx.png")
    @subject_post1 = SubjectPost.create(id:2, user_id:1,  img: "xxxxxxxxxxxxy.png")
    @reply_post = ReplyPost.create(id:1, user_id:1, subject_post_id:1, content: "りんごちゃん")
    @feedback_post = FeedbackPost.create(id:1, content: "みかんちゃんですね")

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

    #==========画像投稿(subject_post)の削除==========
    context "delete subject_post" do
      before "visit subject_post show" do
        visit subject_post_path(@subject_post.id)
        expect(current_path).to eq subject_post_path(@subject_post.id)
      end


    #削除を押下したらsubject_postが消える。
    it 'should delete a subject_post' do
      expect(page).to have_button('削除')
      expect{ click_on '削除' }.to change(SubjectPost, :count).by(0)
    end
  end

    #==========ひとこと(reply_post)の削除==========
    context "delete reply_post" do
      before "visit reply_post show" do
        visit reply_post_path(reply_post1)
        expect(current_path).to eq subject_post_path(reply_post1)
      end

    #削除を押下したらreply_postが消える。
    it 'should delete a reply_post' do
      expect(page).to have_button('削除')
      expect{ click_on '削除' }.to change(ReplyPost, :count).by(0)
    end
  end

    #==========フィードバック(feedback_post)の削除==========
    context "delete reply_post" do
      before "visit reply_post show" do
        visit feedback_post_path(feedback_post1)
        expect(current_path).to eq subject_post_path(feedback_post1)
      end

    #削除を押下したらfeedback_postが消える。
    it 'should delete a feedback_post' do
      expect(page).to have_button('削除')
      expect{ click_on '削除' }.to change(FeedbackPost, :count).by(0)
    end
  end
end

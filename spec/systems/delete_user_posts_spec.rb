require 'rails_helper'
require 'pry'

RSpec.describe "administrator should be able to delete a user", type: :system do
  let(:administrator) { FactoryBot.create(:administrator) }

  before "administrator's login" do
    user1 = User.create(name: "user1", email:"user1@example.com", password:"user1passw")
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
end


RSpec.describe "administrator should be able to delete each post when delete a user related to the posts", type: :system do
  let(:administrator) { FactoryBot.create(:administrator) }
  let(:user) { FactoryBot.create(:user) }

  before "generate posts and administrator's login" do

    log_in(user)

    #userによるsubject_post, reply_post, feedback_postの3段投稿×3の生成
    3.times do
      post_feedback_post()
    end
    click_on("ログアウト")
    log_in(administrator)
  end

  #admin trueのユーザーにおいて

  #==========ユーザーを削除==========
  context "delete user successfully" do

    before "visit user path" do
      visit "users"
      expect(current_path).to eq "/users"
    end

    #削除を押下したらユーザーが消えて他の投稿も全部消える。
    #uerとしては user1, Example user, administratorの順に登録されてる。
    it 'should delete all posts including subject, reply, feedbackposts when delete related user' do
      expect(page).to have_button('削除')
      #click_on ('削除'), match: :first
      expect{ click_on '削除', match: :first }.to change(User, :count).by(-1).and change { SubjectPost.count }.by(-3).and change { ReplyPost.count }.by(-3).and change { FeedbackPost.count }.by(-3)
    end
  end
end


RSpec.describe "administrator should be able to delete just each post", type: :system do
  let(:administrator) { FactoryBot.create(:administrator) }
  let(:user) { FactoryBot.create(:user) }

  before "generate posts and administrator's login" do

    log_in(user)

    #今回もuserによるsubject_post, reply_post, feedback_postの3段投稿×3の生成
    3.times do
      post_feedback_post()
    end
    click_on("ログアウト")
    log_in(administrator)
  end

  #admin trueのユーザーにおいて

  #==========subject_postを削除==========
  context "delete subjectpost successfully" do
    before "visit subject#show" do
      visit subject_post_path(SubjectPost.first.id)
      expect(current_path).to eq subject_post_path(SubjectPost.first.id)
    end

    #削除を押下したらsubject_postが消えてreply, feedbackも投稿も消える。
    #uerとしては user1, Example user, administratorの順に登録されてる。
    it 'should delete feedback and reply_post when delete subject_post' do
      expect(page).to have_button('消去')
      expect{ click_on '消去', match: :first }.to change(FeedbackPost, :count).by(-1).and change { SubjectPost.count }.by(-1).and change { ReplyPost.count }.by(-1)
    end
  end

  #==========reply_postを削除==========
  context "delete replypost successfully" do
    before "visit reply#show" do
      visit reply_post_path(ReplyPost.first.id)
      expect(current_path).to eq reply_post_path(ReplyPost.first.id)
    end

    #削除を押下したらreply_postが消えてfeedbackも投稿も消える。
    #uerとしては user1, Example user, administratorの順に登録されてる。
    it 'should delete feedback_post when delete reply_post' do
      expect(page).to have_button('消去')
      expect{ click_on '消去', match: :first }.to change(FeedbackPost, :count).by(-1).and change { SubjectPost.count }.by(0).and change { ReplyPost.count }.by(-1)
    end
  end

  #==========feedback_postを削除==========
  context "delete feedbackpost successfully" do
    before "visit feedback#show" do
      visit feedback_post_path(FeedbackPost.first.id)
      expect(current_path).to eq feedback_post_path(FeedbackPost.first.id)
    end

    #削除を押下したらfeedback_postが消える。
    #uerとしては user1, Example user, administratorの順に登録されてる。
    it 'should delet feedback_post only' do
      expect(page).to have_button('消去')
      expect{ click_on '消去', match: :first }.to change(FeedbackPost, :count).by(-1).and change { SubjectPost.count }.by(0).and change { ReplyPost.count }.by(0)
    end
  end
end



#======================
#======================
#======================
#非管理者は投稿を削除できない。
#=====================
RSpec.describe "other_user should NOT be able to delete just each post and a user", type: :system do
  let(:other_user) { FactoryBot.create(:other_user) }
  let(:user) { FactoryBot.create(:user) }

  before "generate posts and administrator's login" do

    log_in(user)

    #今回もuserによるsubject_post, reply_post, feedback_postの3段投稿×3の生成
    3.times do
      post_feedback_post()
    end
    click_on("ログアウト")
    log_in(other_user)
  end

  #admin falseのユーザーにおいて

  #==========ユーザーを削除できない==========
  context "CANNOT delete user" do

    before "visit user path" do
      visit "users"
      expect(current_path).to eq "/users"
    end

    #削除マークが表示されない。
    #uerとしては user1, Example user, administratorの順に登録されてる。
    it 'should not find delete button' do
      expect(page).not_to have_button('削除')
    end
  end

  #==========subject_postを削除できない==========
  context "CANNOT delete subjectpost successfully" do
    before "visit subject#show" do
      visit subject_post_path(SubjectPost.first.id)
      expect(current_path).to eq subject_post_path(SubjectPost.first.id)
    end

    #subject_postの消去がみあたらない。
    #uerとしては user1, Example user, administratorの順に登録されてる。
    it 'should not find delete button' do
      expect(page).not_to have_button('消去')
    end
  end

  #==========reply_postを削除できない==========
  context "CANNOT delete replypost successfully" do
    before "visit reply#show" do
      visit reply_post_path(ReplyPost.first.id)
      expect(current_path).to eq reply_post_path(ReplyPost.first.id)
    end

    #reply_postの消去が見当たらない。
    #uerとしては user1, Example user, administratorの順に登録されてる。
    it 'should not find delete button' do
      expect(page).not_to have_button('消去')
    end
  end

  #==========feedback_postは削除できない==========
  context "CANNOT delete feedbackpost successfully" do
    before "visit feedback#show" do
      visit feedback_post_path(FeedbackPost.first.id)
      expect(current_path).to eq feedback_post_path(FeedbackPost.first.id)
    end

    #feedbac_kpostの消去は見当たらない。
    #uerとしては user1, Example user, administratorの順に登録されてる。
    it 'should not find delete button' do
      expect(page).not_to have_button('消去')
    end
  end
end

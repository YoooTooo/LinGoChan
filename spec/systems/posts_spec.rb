require 'pry'
require 'rails_helper'

#削除系は→delete_user_posts_spec.rbに記載

RSpec.describe 'Test for each posts', type: :system do
  let(:user) { FactoryBot.create(:user) }

  before "users login" do
    log_in(user)
    expect(current_path).to eq "/users/#{user.id}"
  end

  scenario 'POST subject_post' do
    visit "/"
    expect(current_path).to eq "/"
    attach_file "subject_post[img]", "rails_logo.png"
    expect{ click_on 'commit' }.to change(SubjectPost, :count).by(1)
    expect(page).to have_content "投稿完了!"
    expect(current_path).to eq "/"
  end

  scenario 'POST reply_post' do

    post_subject_post()
    @subject_post = SubjectPost.first

    visit "/"
    expect(current_path).to eq "/"
    click_on("投稿")
    click_on("一言を書く")
    expect(current_path).to eq "/subject_posts"
    visit subject_post_path(@subject_post.id)
    fill_in 'reply_post[content]', with: "ルビー"
    expect{ click_on 'commit' }.to change(ReplyPost, :count).by(1)
    expect(page).to have_content "投稿完了!"
    expect(current_path).to eq "/"
  end

  scenario 'POST feedback_post' do

    post_reply_post()
    @reply_post = ReplyPost.first

    visit "/"
    expect(current_path).to eq "/"
    click_on("投稿")
    click_on("フィードバックをする")
    expect(current_path).to eq "/reply_posts"
    visit reply_post_path(@reply_post.id)
    fill_in 'feedback_post[content]', with: "ルビーですね～"
    expect{ click_on 'commit' }.to change(FeedbackPost, :count).by(1)
    expect(page).to have_content "投稿完了!"
    expect(current_path).to eq "/"
  end

  scenario 'user can edit feedback_post' do

    post_feedback_post()
    @feedback_post = FeedbackPost.first
    visit feedback_post_path(@feedback_post)
    expect(current_path).to eq feedback_post_path(@feedback_post)
    click_on("編集")
    expect(current_path).to eq edit_feedback_post_path(@feedback_post)
    fill_in 'feedback_post[content]', with: "サファイアかもよ～"
    click_on ('commit')
    visit feedback_post_path(@feedback_post)
    expect(page).to have_content "サファイアかもよ～"
  end

#=========画像添付せずに投稿してみると失敗========
  scenario 'CANNOT post subject_post without image' do
    visit "/"
    expect(current_path).to eq "/"
    expect{ click_on 'commit' }.to change(SubjectPost, :count).by(0)
    expect(page).to have_content "投稿に失敗しました"
    expect(current_path).to eq "/"
  end

#=========140字以上の文字でひとこと投稿してみると失敗========
  before do "generate 145 letters"
    @errored_letters =  "#{'a' * 145}"
    @extended_errored_letters = "#{'a' * 290}"
  end

  scenario 'CANNOT post reply_post with 145 letters' do
    post_subject_post()
    visit subject_post_path(SubjectPost.first.id)
    fill_in 'reply_post[content]', with: @errored_letters
    expect{ click_on 'commit' }.to change(ReplyPost, :count).by(0)
    expect(page).to have_content "投稿に失敗しました"
    expect(current_path).to eq "/"
  end

#=========コメント欄空欄でひとこと投稿してみると失敗========

  scenario 'CANNOT post reply_post without any comments' do
    post_subject_post()
    visit subject_post_path(SubjectPost.first.id)
    fill_in 'reply_post[content]', with: ""
    expect{ click_on 'commit' }.to change(ReplyPost, :count).by(0)
    expect(page).to have_content "投稿に失敗しました"
    expect(current_path).to eq "/"
  end

#=========280字以上の文字でフィードバック投稿してみると失敗========
  scenario 'CANNOT post reply_post with 290 letters' do
    post_reply_post()
    visit reply_post_path(ReplyPost.first.id)
    fill_in 'feedback_post[content]', with: @extended_errored_letters
    expect{ click_on 'commit' }.to change(FeedbackPost, :count).by(0)
    expect(page).to have_content "投稿に失敗しました"
    expect(current_path).to eq "/"
  end

#=========コメント欄空欄でフィードバック投稿してみると失敗========

  scenario 'CANNOT post reply_post without any comments' do
    post_reply_post()
    visit reply_post_path(ReplyPost.first.id)
    fill_in 'feedback_post[content]', with: ""
    expect{ click_on 'commit' }.to change(FeedbackPost, :count).by(0)
    expect(page).to have_content "投稿に失敗しました"
    expect(current_path).to eq "/"
  end

#=========タグ付の投稿テスト========
  context 'POST subject_post with tags' do

    it "success post tags with 2 types of space" do
      visit "/"
      expect(current_path).to eq "/"
      attach_file "subject_post[img]", "rails_logo.png"
      fill_in "subject_post[tag_name]", with: "ジェム　ルビー プログラミング"
      expect{ click_on 'commit' }.to change(Tag, :count).by(3)
      expect(page).to have_content "投稿完了!"
      expect(current_path).to eq "/"
    end

    it "success post tags useing other selectors without spaces" do
      visit "/"
      expect(current_path).to eq "/"
      attach_file "subject_post[img]", "rails_logo.png"
      fill_in "subject_post[tag_name]", with: "ジェム/ルビー,プログラミング"
      expect{ click_on 'commit' }.to change(Tag, :count).by(1)
      expect(page).to have_content "投稿完了!"
      expect(current_path).to eq "/"
    end

    it "should be deleted a tag in pusshing x" do
      post_tags()
      visit "/"
      expect(current_path).to eq "/"
      expect{ click_on "×", match: :first }.to change(Tag, :count).by(-1)
      expect(current_path).to eq "/"
    end
  end
end

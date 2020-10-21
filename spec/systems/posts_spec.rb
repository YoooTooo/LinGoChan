require 'pry'
require 'rails_helper'


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
    expect(current_path).to eq "/"
  end
end

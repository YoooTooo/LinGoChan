require 'pry'

module TestHelper
  def is_logged_in?
    !session[:user_id].nil?
  end

  def log_in(user)
    visit login_path
    fill_in "session_email", with: user.email
    fill_in "session_password", with: user.password
    click_button 'ログインする！'
  end

  def post_subject_post
    visit "/"
    attach_file "subject_post[img]", "rails_logo.png"
    click_on ('commit')
  end

  def post_reply_post
    post_subject_post()
    @subject_post = SubjectPost.first
    visit subject_post_path(@subject_post.id)
    fill_in 'reply_post[content]', with: "ルビー"
    click_on ('commit')
  end

  def post_feedback_post
    post_reply_post()
    @reply_post = ReplyPost.first
    visit reply_post_path(@reply_post.id)
    fill_in 'feedback_post[content]', with: "ルビーですね～"
    click_on ('commit')
  end

 def sign_up(user)
   visit signup_path
   fill_in 'user[name]', with: 'ジャスティン'
   fill_in 'user[email]', with: 'justin@example.com'
   fill_in 'user[password]', with: 'justinchow'
   fill_in "user[password_confirmation]", with: 'justinchow'
   click_on 'commit'
 end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def activate
     update_attribute(:activated,    true)
     update_attribute(:activated_at, Time.zone.now)
   end


end

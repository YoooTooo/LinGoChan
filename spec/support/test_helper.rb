require 'pry'

module TestHelper
  def is_logged_in?
    !session[:user_id].nil?
  end

  def sign_in_as(user)
  post login_path, params: { session: { email: user.email,
                                      password: 'foobar' } }
  end

#  def sign_in_as(user)
#  get login_path
#      fill_in "session_email", with: user.email
#      fill_in "session_password", with: user.password
#      click_button 'ログインする！'
#  end

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

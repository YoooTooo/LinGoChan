class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @subject_post = current_user.subject_posts.build if logged_in?
      @subject_feed_items = current_user.subject_feed.page(params[:page]).per(10)
    end
  end

  def about
  end

end

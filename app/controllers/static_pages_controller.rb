class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @subject_post = current_user.subject_posts.build if logged_in?
      @subject_feed_items = current_user.subject_feed.page(params[:page]).per(10)

      @reply_post = current_user.reply_posts.build if logged_in?
      @reply_feed_items = current_user.reply_feed.page(params[:page]).per(10)

      @feedback_post = current_user.feedback_posts.build if logged_in?
      @feedback_feed_items = current_user.feedback_feed.page(params[:page]).per(10)
    end
  end

  def about
  end

end

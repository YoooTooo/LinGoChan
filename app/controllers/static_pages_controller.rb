class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @subject_post = current_user.subject_posts.build if logged_in?
      @subject_posts = current_user.subject_feed.page(params[:page]).per(10)

      @tag = Tag.new
      @tag_list = Tag.all

      @reply_post = current_user.reply_posts.build if logged_in?
      @reply_posts = current_user.reply_feed.page(params[:page]).per(10)

      @feedback_post = current_user.feedback_posts.build if logged_in?
      @feedback_posts = current_user.feedback_feed.page(params[:page]).per(10)
    end
  end

  def about
  end

end

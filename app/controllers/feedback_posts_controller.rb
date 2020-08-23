class FeedbackPostsController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy, :edit]
  before_action :correct_user, only: [:destroy, :edit]


  def create
    @feedback_post = current_user.feedback_posts.build(feedback_post_params)
    if @feedback_post.save
      flash[:success] = "投稿完了!"
      redirect_to root_url
    else
      @feedback_feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @feedback_post.destroy
    flash[:success] = "投稿を消去しました"
    redirect_to request.referrer || root_url
  end

  def edit
  end

private
  def reply_post_params
  params.require(:reply_post).permit(:content)
  end

  def correct_user
      @feedback_post = current_user.feedback_posts.find_by(id: params[:id])
      redirect_to root_url if @feedback_post.nil?
    end
end

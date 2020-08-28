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
      flash[:danger] = '投稿に失敗しました'
      render 'static_pages/home'
    end
  end

  def destroy
    @feedback_post.destroy
    flash[:success] = "投稿を消去しました"
    redirect_to request.referrer || root_url
  end

  def edit
    @feedback_post = FeedbackPost.find(params[:id])
  end

  def index
    @feedback_posts = FeedbackPost.all.page(params[:page]).per(10)
  end

  def show

  end

private
  def feedback_post_params
  params.require(:feedback_post).permit(:content, :subject_post_id, :reply_post_id)
  end

  def correct_user
      @feedback_post = current_user.feedback_posts.find_by(id: params[:id])
      redirect_to root_url if @feedback_post.nil?
    end
end

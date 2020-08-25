class ReplyPostsController < ApplicationController
  before_action :logged_in_user, only: [:create]
#reply_postは画像削除を実装しない。

  def create
    @reply_post = current_user.reply_posts.build(reply_post_params)
    if @reply_post.save
       @subject_post = SubjectPost.new
      flash[:success] = "投稿完了!"
      redirect_to root_url
    else
      flash[:danger] = '投稿に失敗しました'
      @reply_feed_items = []
      @subject_post = SubjectPost.new
      render 'static_pages/home'
    end
  end

  def index
    @reply_posts = ReplyPost.all.page(params[:page]).per(10)
  end

  def show
    @reply_posts = ReplyPost.find(params[:id])
  end

  private
    def reply_post_params
    params.require(:reply_post).permit(:content)

    end
end

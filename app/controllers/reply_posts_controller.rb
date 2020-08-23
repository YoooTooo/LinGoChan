class ReplyPostsController < ApplicationController
  before_action :logged_in_user, only: [:create]
#reply_postは画像削除を実装しない。


  def create
    @reply_post = current_user.reply_posts.build(reply_post_params)
    if @reply_post.save
      flash[:success] = "投稿完了!"
      redirect_to root_url
    else
      @reply_feed_items = []
      render 'static_pages/home'
    end
  end

  private
    def reply_post_params
    params.require(:reply_post).permit(:content)

    end
end

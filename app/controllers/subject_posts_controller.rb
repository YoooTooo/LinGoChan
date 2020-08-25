class SubjectPostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :show]
#subject_postは画像削除を実装しない。
#一覧(index)は非ログインユーザでも見れる。


  def create
    @subject_post = current_user.subject_posts.build(subject_post_params)
    if @subject_post.save
      flash[:success] = "投稿完了!"
      redirect_to root_url
    else
      @subject_feed_items = []
      render 'static_pages/home'
    end
  end

  def index
    @subject_posts = SubjectPost.all.page(params[:page]).per(10)
  end

  def show
    @subject_post = SubjectPost.find(params[:id])
    @reply_post = ReplyPost.new
  end

  private
   def subject_post_params
    params.require(:subject_post).permit(:img)
   end
end

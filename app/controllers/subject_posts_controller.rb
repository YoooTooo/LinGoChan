class SubjectPostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :show]
#subject_postは画像削除を実装しない。
#一覧(index)は非ログインユーザでも見れる。


  def create
    @subject_post = current_user.subject_posts.build(subject_post_params)
      tag_list = params[:subject_post][:tag_name].split(nil)
    if @subject_post.save
       @subject_post.save_tag(tag_list)
      flash[:success] = "投稿完了!"
      redirect_to root_url
    else
      @subject_feed_items = []
      flash[:danger] = '投稿に失敗しました'
      render 'static_pages/home'
    end
  end

  def index
    @subject_posts = SubjectPost.all.page(params[:page]).per(10)
    @tag_list = Tag.all  #タグ一覧を表示。
  end

  def show
    @subject_post = SubjectPost.find(params[:id])
    @reply_posts = @subject_post.reply_posts
    @reply_post = @subject_post.reply_posts.build
    @subject_post_tags = @subject_post.tags    #クリックした投稿に紐付けられているタグを取得。
  end

  def search
    @tag_list = Tag.all                               #投稿一覧表示ページでも全てのタグを表示するために、タグを全取得
    @tag = Tag.find(params[:tag_id])                  #クリックしたタグを取得
    @subject_posts = @tag.subject_posts.all           #クリックしたタグに紐付けられた投稿を全て表示
  end


  private
   def subject_post_params
    params.require(:subject_post).permit(:img)
   end
end

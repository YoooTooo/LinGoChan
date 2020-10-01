class SubjectPostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :show]
  before_action :admin_user,     only: [:destroy]
#一覧(index)は非ログインユーザでも見れるようにしたい(後々)

  def create
    @subject_post = current_user.subject_posts.build(subject_post_params)
      tag_list = params[:subject_post][:tag_name].gsub("　", " ").split(" ")
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
    @tag_list = Tag.all                               #タグ一覧を表示。
  end

  def show
    @subject_post = SubjectPost.find(params[:id])
    @reply_posts = @subject_post.reply_posts
    @reply_post = @subject_post.reply_posts.build
    @subject_post_tags = @subject_post.tags           #クリックした投稿に紐付けられているタグを取得。
  end

  def destroy
    @subject_post = SubjectPost.find(params[:id])
    @subject_post.destroy
    flash[:success] = "投稿を消去しました"
    redirect_to root_url
  end

  private
    def subject_post_params
     params.require(:subject_post).permit(:img)
    end
end

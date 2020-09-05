class TagsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy unless @tag.nil?
    flash[:success] = "投稿を消去しました"
    redirect_to request.referrer || root_url
  end

end

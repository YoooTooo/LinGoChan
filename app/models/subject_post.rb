class SubjectPost < ApplicationRecord
  mount_uploader :img, ImgUploader

#投稿用の関連付け
  has_many :reply_posts, dependent: :destroy
  belongs_to :user

#タグ用の関連付け
  has_many :tagmaps, dependent: :destroy
  has_many :tags, through: :tagmaps

  #postの順番を降順にする
  default_scope -> { order(created_at: :desc) }
  mount_uploader :img, ImgUploader
  validates :user_id, presence: true
  #画像のサイズのためのバリデーションprivate以下に定義
  validate  :img_size


  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end

    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_post_tag
    end
  end

  private
# アップロードされた画像のサイズをバリデーションする
    def img_size
      if img.size > 5.megabytes
        errors.add(:img, "画像は5MB以下にしてください")
      end
    end

end

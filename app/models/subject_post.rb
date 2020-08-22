class SubjectPost < ApplicationRecord
  mount_uploader :img, ImgUploader

  has_many :reply_posts, dependent: :destroy
  belongs_to :user, dependent: :destroy

  #postの順番を降順にする
  default_scope -> { order(created_at: :desc) }
  mount_uploader :img, PictureUploader
  validates :user_id, presence: true
  #画像のサイズのためのバリデーションprivate以下に定義
  validate  :img_size

  private
# アップロードされた画像のサイズをバリデーションする
    def img_size
      if picture.size > 5.megabytes
        errors.add(:img, "画像は5MB以下にしてください")
      end
    end

end

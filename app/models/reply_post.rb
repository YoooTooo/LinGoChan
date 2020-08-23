class ReplyPost < ApplicationRecord
  has_many :subject_posts, dependent: :destroy
  belongs_to :user
  belongs_to :subject_post

  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :subject_post_id, presence: true

  validates :content, presence: true, length: { maximum: 140 }
end

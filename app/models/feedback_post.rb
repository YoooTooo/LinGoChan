class FeedbackPost < ApplicationRecord
  belongs_to :user
  belongs_to :reply_post

  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :reply_post_id, presence: true

  validates :content, presence: true, length: { maximum: 280 }
end

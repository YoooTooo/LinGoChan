class Tagmap < ApplicationRecord
  belongs_to :subject_post
  belongs_to :tag
  validates :subject_post_id, presence: true
  validates :tag_id, presence: true
end

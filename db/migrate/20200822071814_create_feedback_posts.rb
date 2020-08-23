class CreateFeedbackPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :feedback_posts do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :reply_post, null: false, foreign_key: true

      t.timestamps
    end
    add_index :feedback_posts, [:user_id, :created_at]
    add_index :feedback_posts, [:reply_post_id, :created_at]
  end
end

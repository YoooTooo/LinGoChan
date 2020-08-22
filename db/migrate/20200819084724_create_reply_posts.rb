class CreateReplyPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :reply_posts do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
     add_index :reply_posts, [:user_id, :created_at]
  end
end

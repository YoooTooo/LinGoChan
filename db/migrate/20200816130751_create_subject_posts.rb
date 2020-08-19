class CreateSubjectPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :subject_posts do |t|
      t.string :img
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :subject_posts, [:user_id, :created_at]
  end
end

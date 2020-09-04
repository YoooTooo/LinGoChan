class CreateTagmaps < ActiveRecord::Migration[6.0]
  def change
    create_table :tagmaps do |t|

      t.references :subject_post, type: :bigint, null: false, foreign_key: true
      t.references :tag, type: :bigint, null: false, foreign_key: true

      t.timestamps
    end
  end
end

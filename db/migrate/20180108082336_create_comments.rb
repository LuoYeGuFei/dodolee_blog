class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :article_id
      t.text :content
      t.text :content_html
      t.datetime :comment_at

      t.timestamps
    end

    add_index :comments, [:user_id]
    add_index :comments, [:article_id]
  end
end

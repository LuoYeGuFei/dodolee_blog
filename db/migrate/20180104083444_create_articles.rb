class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.text :content_html
      t.integer :category_id
      t.integer :personal_category_id
      t.integer :view_count
      t.string :status

      t.timestamps
    end

    add_index :articles, [:user_id]
    add_index :articles, [:title]
    add_index :articles, [:category_id]
    add_index :articles, [:personal_category_id]
    add_index :articles, [:status]
  end
end

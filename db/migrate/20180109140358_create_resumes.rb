class CreateResumes < ActiveRecord::Migration[5.1]
  def change
    create_table :resumes do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.text :content_html

      t.timestamps
    end

    add_index :resumes, [:user_id]
  end
end

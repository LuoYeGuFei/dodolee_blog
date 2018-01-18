class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :is_admin, :boolean, default: false
    add_column :users, :introduction, :string
    add_column :users, :cellphone, :string
    add_column :users, :city, :string
    add_column :users, :company, :string
    add_column :users, :homepage, :string
    add_column :users, :github, :string
    add_column :users, :alipay, :string
    add_column :users, :wechat, :string
    add_column :users, :signature, :string
  end
end

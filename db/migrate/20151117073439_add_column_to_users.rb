class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :profile_image_url, :content
    remove_column :users, :profile_image_url

  end
end

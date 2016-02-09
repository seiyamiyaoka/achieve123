class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :profile_image_url, :string
    remove_column :users, :profile_image_url

  end
end

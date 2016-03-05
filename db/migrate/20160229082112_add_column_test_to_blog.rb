class AddColumnTestToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :email, :string
    add_column :blogs, :test, :string
    add_column :blogs, :age, :integer
  end
end

class AddColumnToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :addres, :text
    add_column :contacts, :number, :string
  end
end

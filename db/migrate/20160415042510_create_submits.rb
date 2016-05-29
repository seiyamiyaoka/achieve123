class CreateSubmits < ActiveRecord::Migration
  def change
    create_table :submits do |t|
      t.references :task, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :charge_id, null: false
      t.integer :status
      t.text :message

      t.timestamps null: false
    end
  end
end

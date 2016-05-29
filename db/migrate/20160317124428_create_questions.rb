class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.integer :language
      t.integer :category

      t.timestamps null: false
    end
  end
end

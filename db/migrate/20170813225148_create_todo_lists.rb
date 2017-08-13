class CreateTodoLists < ActiveRecord::Migration[5.1]
  def change
    create_table :todo_lists do |t|
      t.string :name
      t.integer :user_id
      t.date :date
      t.boolean :is_favorited, default: false

      t.timestamps
    end
  end
end

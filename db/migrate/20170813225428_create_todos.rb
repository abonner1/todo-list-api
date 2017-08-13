class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.text :description
      t.integer :todo_list_id
      t.boolean :is_completed

      t.timestamps
    end
  end
end

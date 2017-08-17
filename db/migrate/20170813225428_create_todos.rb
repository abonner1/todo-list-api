class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :description
      t.integer :todo_list_id
      t.boolean :is_completed, default: false

      t.timestamps
    end
  end
end

class AddFavoritesToTodoLists < ActiveRecord::Migration[5.1]
  def change
    add_column :todo_lists, :favorited, :boolean, default: false
  end
end

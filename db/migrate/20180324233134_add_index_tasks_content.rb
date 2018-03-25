class AddIndexTasksContent < ActiveRecord::Migration[5.1]
  def change
    add_index :tasks, :content
  end
end

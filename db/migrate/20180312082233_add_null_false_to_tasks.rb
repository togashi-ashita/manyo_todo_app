class AddNullFalseToTasks < ActiveRecord::Migration[5.1]
  def change
    change_column :tasks, :content, :string, null: false
  end
end

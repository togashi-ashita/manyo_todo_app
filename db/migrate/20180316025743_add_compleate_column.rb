class AddCompleateColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :compleate, :boolean, :null => false
  end
end

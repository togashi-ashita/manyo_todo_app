class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :content
      t.string :memo
      t.timestamps
    end
  end
end

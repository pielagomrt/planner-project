class CompleteTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :completed, :boolean
  end
end

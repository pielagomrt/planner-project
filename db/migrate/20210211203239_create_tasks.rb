class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :name
      t.text :description
      t.date :date
      t.boolean :completed
      t.timestamps
    end
  end
end

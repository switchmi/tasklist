class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :details
      t.date :due_date
      t.references :list, foreign_key:true, null: false

      t.timestamps
    end
  end
end

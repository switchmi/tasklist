class AddPriorityToLists < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :priority, :integer
  end
end

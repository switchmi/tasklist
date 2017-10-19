class AddImageColumnToTasks < ActiveRecord::Migration[5.1]
  def up
  add_attachment :tasks, :task_image
  end

  def down
  remove_attachment :tasks, :task_image
  end
end

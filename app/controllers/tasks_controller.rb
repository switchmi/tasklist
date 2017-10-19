class TasksController < ApplicationController
  def index
    @list = List.find(params[:list_id])
    @tasks = @list.tasks.all
    @task = @list.tasks.new
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(get_params)
    @tasks = @list.tasks.all
    if @task.save
      redirect_to list_tasks_path
    else
      render :index
    end
  end

  def edit
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
  end

  def update
    @task = List.find(params[:list_id]).tasks.find(params[:id])
    if @task.update(get_params)
      redirect_to list_tasks_path
    else
      render :edit
    end
  end

  def destroy
    @task = List.find(params[:list_id]).tasks.find(params[:id])
    @task.destroy
    @task.task_image = nil
    redirect_to list_tasks_path
  end

  def show
    @list = List.find(params[:list_id])
    @task = List.find(params[:list_id]).tasks.find(params[:id])
  end

  private

  def get_params

    params.require(:task).permit(:title, :details, :due_date, :task_image, :completed)

  end

end

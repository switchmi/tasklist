class ListsController < ApplicationController

  def index
    @lists = List.all
    @list = List.new
  end

  def edit
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "Tasklist added !"
      redirect_to lists_path
    else
      render :new
    end
  end

  def update
    @list = List.find(params[:id])
    if
      @list.update_attributes(list_params)
      redirect_to lists_path
    else
      render :index
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    flash[:alert] = "TaskList Deleted !"
    redirect_to lists_path
  end

  def show
  end



private

  def prepare_list
    @list = List.find(params[:list_id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end

class ListsController < ApplicationController

  def index
    @list = List.new
    @lists = if params[:search]
      List.where('name LIKE?', "%#{params[:search]}%")
    else
      List.all
    end
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
      flash[:notice] = "Cannot be blank !"
      redirect_to lists_path
    end
  end

  def update
    @lists = List.all
    @list = List.find(params[:id])
    if
      @list.update_attributes(list_params)
      redirect_to lists_path
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    flash[:alert] = "TaskList Deleted !"
    redirect_to lists_path
  end

  private

  def prepare_list
    @list = List.find(params[:list_id])
  end


  def list_params
    params.require(:list).permit(:name, :search)
  end

end

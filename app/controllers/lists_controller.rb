class ListsController < ApplicationController


  def index
    @list = List.new
    @lists = List.all
  end

  def create
    @lists = List.all
    @list = List.new(get_params)
    if @list.save
      redirect_to lists_path
    else
      render :index
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(get_params)
      redirect_to lists_path
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  def new
  end

  def show
  end

  private

  def get_params
    params.require(:list).permit(:name)
  end

end

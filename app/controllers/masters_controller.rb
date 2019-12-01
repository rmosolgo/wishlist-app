class MastersController < ApplicationController
  def new
    @list = List.new
  end

  def create
    list_params = params.require(:list).permit(:title)
    # TODO handle errors
    list = List.create!(list_params)
    redirect_to(master_path(list.master_secret))
  end

  def show
    @list = List.find_by(master_secret: params[:id])
  end

  def update
    @list = List.find_by(master_secret: params[:id])
    list_attributes = params.require(:list).permit(:title)
    # TODO handle errors
    @list.update!(list_attributes)
    redirect_to(master_path(@list.master_secret))
  end

  def destroy
    @list = List.find_by(master_secret: params[:id])
    @list.destroy
    redirect_to(new_master_path)
  end
end

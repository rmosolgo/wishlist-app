class ItemsController < ApplicationController
  def create
    list = List.find_by(master_secret: params[:master_id])
    item_params = params.require(:item).permit(:title)
    item = list.items.build(item_params)
    item.save!
    list.touch
    redirect_to(master_path(list.master_secret))
  end

  def update
    list = List.find_by(master_secret: params[:master_id])
    item = list.items.find_by(id: params[:id])
    item_params = params.require(:item).permit(:title)
    item.update!(item_params)
    list.touch
    redirect_to(master_path(list.master_secret))
  end

  def destroy
    list = List.find_by(master_secret: params[:master_id])
    item = list.items.find_by(id: params[:id])
    item.destroy!
    list.touch
    redirect_to(master_path(list.master_secret))
  end
end

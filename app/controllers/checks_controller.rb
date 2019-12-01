class ChecksController < ApplicationController
  def create
    set_checked(true)
  end

  def destroy
    set_checked(false)
  end

  private

  def set_checked(checked_value)
    @item = Item.joins(:list).where(
      "lists.share_secret" => params[:share_id],
      "id" => params[:item_id]
    ).first
    @item.update!(checked: checked_value)
    redirect_to(share_path(params[:share_id]))
  end
end

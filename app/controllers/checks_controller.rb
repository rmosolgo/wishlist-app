class ChecksController < ApplicationController
  def create
    set_checked(true)
  end

  def destroy
    set_checked(false)
  end

  private

  def set_checked(checked_value)
    list = List.find_by(share_secret: params[:share_id])
    item = list.items.find_by(id: params[:item_id])
    item.update!(checked: checked_value)
    redirect_to(share_vanity_path(id: params[:share_id], title: list.title.parameterize))
  end
end

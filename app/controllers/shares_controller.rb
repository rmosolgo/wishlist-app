class SharesController < ApplicationController
  def show
    @preview = false
    # Render a not-found message on `nil`
    @list = List.where(share_secret: params[:id]).first
  end
end

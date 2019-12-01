class PreviewsController < ApplicationController
  def show
    # Render a not-found message on `nil`
    @preview = true
    flash.now[:info] = "This is a preview of your list."
    @list = List.where(share_secret: params[:id]).first
    render "shares/show"
  end
end

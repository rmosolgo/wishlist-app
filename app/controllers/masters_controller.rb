class MastersController < ApplicationController
  def new
    @list = List.new
  end

  def create
    list_params = params.require(:list).permit(:title)
    # TODO handle errors
    list = List.create!(list_params)
    flash[:success] = "Welcome to your new list! Don't lose the link to this page."
    redirect_to(master_vanity_path(id: list.master_secret, title: list.title.parameterize))
  end

  def show
    @list = List.find_by(master_secret: params[:id])
    if @list.nil?
      render inline: "<p>No list found; it may have been deleted by its owner.</p>"
    end
  end

  def update
    list = List.find_by(master_secret: params[:id])
    list_attributes = params.require(:list).permit(:title)
    # TODO handle errors
    list.update!(list_attributes)
    redirect_to(master_vanity_path(id: list.master_secret, title: list.title.parameterize))
  end

  def destroy
    @list = List.find_by(master_secret: params[:id])
    @list.destroy
    redirect_to(root_path)
  end
end

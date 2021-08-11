class ItemsController < ApplicationController
  # before_action :authenticate_user!, only: [:new]
  def index
  end

  def new
    @item = Item.new
  end

  def edit
  end

  private
  def item_params
    params.require(:item).permit(:name).merge(user_id: current_user.id)
  end

end

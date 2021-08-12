class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  private
  def item_params
    params.require(:item).permit(:image , :name , :text , :category_id , :charge_id , :status_id , :area_id , :indication_id , :price).merge(user_id: current_user.id)
  end

end

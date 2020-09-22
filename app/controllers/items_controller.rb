class ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  
  def index
    @items = Item.all.order("id DESC")
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :status_id, :price, :item_address_id,:days_to_ship_id, :shipping_charges_id, :category_id,:image).merge(user_id: current_user.id)
  end
end

class ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  
  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.permit(:name, :text, :status_id, :price, :item_address_id,:days_to_ship_id, :shipping_charges_id, :category_id).merge(user_id: current_user.id)
  end
end
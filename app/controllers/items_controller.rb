class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show]

  def new
    @item = Item.new
  end
  
  def edit
  end

  def update
    if @item.update(item_params)
        redirect_to action: :show
    else
      render :edit
    end
  end

  def show
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

  def set_item
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :status_id, :price, :item_address_id,:days_to_ship_id, :shipping_charge_id, :category_id,:image).merge(user_id: current_user.id)
  end
end

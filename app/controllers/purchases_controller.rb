class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase = UserPurchase.new
  end

  def create
    # binding.pry
    @item = Item.find(params[:item_id])
    @purchase = UserPurchase.new(purchase_params)
    if @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def purchase_params
    params.require(:user_purchase).permit(:postcode, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id:current_user.id, item_id: params[:item_id])
  end
end

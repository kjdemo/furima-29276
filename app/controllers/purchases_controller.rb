class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase = UserPurchase.new
  end

  def create
    # binding.pry
    @item = Item.find(params[:item_id])
    @purchase = UserPurchase.new(purchase_params)
    # binding.pry
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def purchase_params
    params.require(:user_purchase).permit(:postcode, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id:current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    # binding.pry
    Payjp::Charge.create(
      amount: @item.price,  
      card: purchase_params[:token], 
      currency:'jpy'
    )
  end
end

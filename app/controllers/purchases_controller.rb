class PurchasesController < ApplicationController
  before_action :set_item, only: [:index,:create, :user_check, :purchase_check]
  before_action :user_check, only: [:index]
  before_action :purchase_check, only: [:index]

  def index
    @purchase = UserPurchase.new
  end

  def create
    @purchase = UserPurchase.new(purchase_params)
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
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: purchase_params[:token], 
      currency:'jpy'
    )
  end

  def user_check
    if user_signed_in?
      if @item.user_id == current_user.id
        redirect_to root_path
      end
    else
      redirect_to new_user_session_path
    end
  end

  def purchase_check
    if @item.purchase != nil
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end

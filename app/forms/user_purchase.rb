class UserPurchase

  include ActiveModel::Model
  
  attr_accessor :postcode, :prefecture_id, :city, :address, :building, :phone_number, :purchase_id, :user_id, :item_id

  # validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  with_options presence: true do
    validates :postcode
  end

  def save
    # binding.pry
    # 保存するのは配送先の情報とpurchaseテーブルのuser_idと_item_id,フォームオブジェクトは数値か文字しか扱えない（.id)はできない
    purchase = Purchase.create!(user_id: user_id, item_id: item_id)
    ShippingAddress.create!(postcode: postcode, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
    # binding.pry
  end

end
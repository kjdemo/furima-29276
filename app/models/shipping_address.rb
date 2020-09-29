class ShippingAddress < ApplicationRecord
  belongs_to :purchase

   #空の投稿を保存できないようにする
  #  validates :prefecture_id presence: true

   #都道府県の選択が「--」の時は保存できないようにする
   validates :prefecture_id, numericality: { other_than: 1 } 
end

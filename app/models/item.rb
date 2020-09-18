class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :status, :item_address, :days_to_ship, :shipping_charges 

  #空の投稿を保存できないようにする
  validates , :category, :status, :item_address, :days_to_ship, :shipping_charges,:price, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :status_id, :shipping_charge_id, :item_address_id, :days_to_ship_id, numericality: { other_than: 1 } 

end
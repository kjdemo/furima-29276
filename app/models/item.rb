class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :days_to_ship
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :item_address
  #空の投稿を保存できないようにする
  validates :category_id, :status_id, :item_address_id, :days_to_ship_id, :shipping_charges_id, presence: true

  #アクティブハッシュ系の選択が「--」の時は保存できないようにする
  validates :category_id, :status_id, :shipping_charges_id, :item_address_id, :days_to_ship_id, numericality: { other_than: 1 } 

  has_one_attached :image
end
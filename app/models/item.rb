class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :days_to_ship
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :item_address


  validates :name,:category_id, :status_id, :text, :price, :user_id, :item_address_id, :days_to_ship_id, :shipping_charges_id, presence: true
  validates :category_id, :status_id, :shipping_charges_id, :item_address_id, :days_to_ship_id, numericality: { other_than: 1 } 
  validates :name, length: { maximum: 40 }
  validates :text, length: { maximum: 1000 }
  PRICE_REGEX =/\A[a-z0-9]+\z/i
  validates :price,numericality:{greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999},format: { with: PRICE_REGEX}
  has_one_attached :image
end
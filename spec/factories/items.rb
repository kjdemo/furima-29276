FactoryBot.define do
  factory :item do
    name {"タンス"}
    category_id{"2"}
    status_id{"2"}
    text{"高級タンスです"}
    price{"400"}
    item_address_id{"2"}
    days_to_ship_id{"2"}
    shipping_charges_id{"2"}
    association :user
  end
end

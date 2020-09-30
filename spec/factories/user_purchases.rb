FactoryBot.define do
  factory :user_purchase do
    postcode  {"123-1234"}
    prefecture_id{"2"}
    city{"札幌市"}
    address {"北区"}
    phone_number {"09012345678"}
    token{"abcdefg"}
  end
end

FactoryBot.define do
  factory :user do
    nick_name {Faker::Name.initials}
    email {Faker::Internet.free_email}
    password {"1234aa"}
    password_confirmation {password}
    first_name {Faker::Name.initials}
    last_name {Faker::Name.initials}
    first_name_kana {"カナ"}
    last_name_kana {"カナ"}
    birthday {Faker::Date.between(from: '1930-01-01', to: '2015-12-31')}
  end
end
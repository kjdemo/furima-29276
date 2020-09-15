FactoryBot.define do
  factory :user do
    nick_name {Faker::Name.initials}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name {Faker::Name.initials}
    last_name {Faker::Name.initials}
    first_name_kana {"カナ"}
    last_name_kana {"カナ"}
    birthday {1931-05-04}
  end
 end
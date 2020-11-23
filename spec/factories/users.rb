FactoryBot.define do
  factory :user do
    nickname  {Faker::Internet.username}
    email {Faker::Internet.email}
    password  {'aaaaa11'}
    password_confirmation {password}
    firstname  {'田中'}
    lastname  {'圭'}
    firstname_kana  {'タナカ'}
    lastname_kana  {'ケイ'}
    bithday {'1930-01-01'}
  end
end
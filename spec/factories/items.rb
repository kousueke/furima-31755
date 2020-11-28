FactoryBot.define do
  factory :item do
    name { '商品名' }
    explanation { '説明文' }
    category_id { 2 }
    status_id { 2 }
    deli_price_id { 2 }
    area_id { 2 }
    deli_day_id { 2 }
    price { 999 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/logo.png'), filename: 'logo.png')
    end
  end
end

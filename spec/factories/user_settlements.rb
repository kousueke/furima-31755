FactoryBot.define do
  factory :user_settlement do
    postalcode { 123-4567 }
    area_id { 2 }
    municipality { '台東区' }
    address { '上野' }
    buildingname { '東上野1-1' }
    tell { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
    association :user
    association :item
  end
end

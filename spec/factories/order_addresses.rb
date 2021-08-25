FactoryBot.define do
  factory :order_address do
    token {"tok_abcdefghijk00000000000000000"}
    deli_num { '123-4567' }
    area_id { 3 }
    ward { '東京都' }
    block { '1-1' }
    room { '東京ハイツ' }
    phone { '09012345678' }
  end
end

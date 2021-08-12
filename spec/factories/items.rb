FactoryBot.define do
  factory :item do
    name {"野菜"}
    text {Faker::Lorem.sentence}
    category_id {5}
    status_id {2}
    charge_id {2}
    area_id {30}    # {Faker::Gimei.address.prefecture.kanji}で都道府県の出力可
    indication_id {2}
    price {Faker::Number.number(digits: 5)}

    association :user 
    # has_one :purchase
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end

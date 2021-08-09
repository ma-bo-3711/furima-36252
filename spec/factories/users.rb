FactoryBot.define do
  factory :user do
    name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    first_name {"太郎"}
    last_name {"山田"}
    first_kana {"タロウ"}
    last_kana {"ヤマダ"}
    birth  {Faker::Date.birthday(min_age: 18, max_age: 65)}
    password {"abc123"}
    password_confirmation {password}
  end
end


FactoryBot.define do
  factory :user do
    gimei = Gimei.unique.name
    email                 { Faker::Internet.free_email }
    nickname              { Faker::Food.sushi }
    name_1                { gimei.last.kanji }
    name_2                { gimei.first.kanji }
    kana_1                { gimei.last.katakana }
    kana_2                { gimei.first.katakana }
    birthday              { Faker::Date.between(from: '1930-1-1', to: 5.years.ago) }
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
  end
end

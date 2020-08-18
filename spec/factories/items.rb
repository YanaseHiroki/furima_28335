FactoryBot.define do
  factory :item do
    title       { Faker::Lorem.sentence }
    description { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    state_id    { Faker::Number.between(from: 2, to: 7) }
    charge_id   { Faker::Number.between(from: 2, to: 3) }
    pref_id     { Faker::Number.between(from: 2, to: 48) }
    due_id      { Faker::Number.between(from: 2, to: 4) }
    price       { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
  end
end

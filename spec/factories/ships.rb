FactoryBot.define do
  factory :ship do
    postal { '734-0001' }
    pref_id { 35 }
    city { '広島市南区出汐' }
    number { '1-3-11' }
    house { 'イケダビルディング' }
    tel { '08012345678' }
    association :buy
  end
end

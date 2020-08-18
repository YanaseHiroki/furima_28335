FactoryBot.define do
  factory :item do
    title       { '【美品】アップル製MacBook 13インチSSD 256ギガバイトメモリ8GB' }
    description { 'ご覧いただきありがとうございます！こちらは最新モデルのMacBookになります!' }
    category_id { '8' }
    state_id    { '4' }
    charge_id   { '3' }
    pref_id     { '2' }
    due_id      { '2' }
    price       { '49800' }
    association :user
  end
end

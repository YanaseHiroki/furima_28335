class Ship < ApplicationRecord
  belongs_to_active_hash :pref
  # すべての属性が空でないことを確認
  with_options presence: true do
    validates :buy
    validates :postal, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :pref_id
    validates :city
    validates :number
    validates :house
    validates :tel, format: { with: /\A\d{,11}\z/ }
  end
end

# アソシエーション
belongs_to :buy
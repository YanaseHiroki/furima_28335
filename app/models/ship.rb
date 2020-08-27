class Ship < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :pref

  # すべての属性が空でないことを確認
  with_options presence: true do
    validates :buy_id
    # 7桁の郵便番号（ハイフンあり）か確認
    validates :postal, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :pref_id
    validates :city
    validates :number
    # 11桁以下の数字か確認
    validates :tel, format: { with: /\A\d{,11}\z/ }
  end


  # アソシエーション
  belongs_to :buy
end
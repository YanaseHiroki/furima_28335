class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :state
    belongs_to_active_hash :charge
    belongs_to_active_hash :pref
    belongs_to_active_hash :due
  # すべての属性が「空でない」ことを確認
  with_options presence: true do
    validates :user_id
    validates :title
    validates :image
    validates :description
    validates :price
    validates :star
    # idが"1"(---)以外の数字か確認
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :state_id
      validates :charge_id
      validates :pref_id
      validates :due_id
    end
  end
  # アソシエーション
  belongs_to :user
  has_one_attached :image
  # has_one :buy
end

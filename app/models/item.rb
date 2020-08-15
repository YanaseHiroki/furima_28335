class Item < ApplicationRecord
  # 指定された属性が「空でない」ことを確認
  validates :user, :title, :image, :description, :category_id, :state_id,
            :charge_id, :area_id, :due_id, :price, :star, presence: true
  # "1"以外の数字か確認
  validates :category_id, :state_id, :charge_id, :area_id, :due_id, numericality: { other_than: 1 }
  # アソシエーション
  belongs_to :user
  # has_one :buy
end

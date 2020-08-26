class Buy < ApplicationRecord
  with_options presence: true do
    validates :user, null: false
    validates :item, null: false
  end
  # アソシエーション
  belongs_to :item
  belongs_to :user
  has_one :ship
end

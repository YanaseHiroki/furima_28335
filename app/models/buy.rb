class Buy < ApplicationRecord
  with_options presence: true do
    validates :user, null: false, foreign_key: true
    validates :item, null: false, foreign_key: true
  end
end

# アソシエーション
belongs_to :item
belongs_to :user
has_one :ship
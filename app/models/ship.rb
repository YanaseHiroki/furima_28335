class Ship < ApplicationRecord
  belongs_to_active_hash :pref
end

# アソシエーション
belongs_to :buy
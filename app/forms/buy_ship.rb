class BuyShip

  include ActiveModel::Model
  attr_accessor :postal, :pref_id, :city, :number, :house, :tel

    # すべての属性が空でないことを確認
    with_options presence: true do
      validates :buy
      # 7桁の郵便番号（ハイフンあり）か確認
      validates :postal, format: { with: /\A\d{3}[-]\d{4}\z/ }
      validates :pref_id
      validates :city
      validates :number
      validates :house
      # 11桁以下の数字か確認
      validates :tel, format: { with: /\A\d{,11}\z/ }
    end

    def save
      ship = Ship.new(postal: postal, pref_id: pref_id, city: city, number: number, house: house)
      if ship.valid?
        ship.save
      else
        render 
      end
      buy = Buy.new(user: user_id, ship: ship.id)
      if buy.valid?
        buy.save
      end
    end
end
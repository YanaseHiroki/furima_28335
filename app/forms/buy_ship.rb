class BuyShip
  include ActiveModel::Model
  attr_accessor :token, :postal, :pref_id, :city, :number, :house, :tel

  def save
    ship = Ship.new(postal: postal, pref_id: pref_id, city: city, number: number, house: house)
    if ship.valid?
      ship.save
    else
      render
    end
    buy = Buy.new(user: user_id, ship: ship.id)
    buy.save if buy.valid?
  end
end

class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :sold_item, only: [:index, :create]
  before_action :buyer, only: [:index, :create]

  def index
    @buy = Buy.new
  end

  def create
    @buy = Buy.new(
      user_id: buy_params[:user],
      item_id: buy_params[:item]
    )
    if @buy.valid?
      @buy.save
      @ship = Ship.new(
        buy_id: @buy.id,
        postal: buy_params[:postal],
        pref_id: buy_params[:pref_id],
        city: buy_params[:city],
        number: buy_params[:number],
        house: buy_params[:house],
        tel: buy_params[:tel]
      )
      if @ship.valid?
        pay_item
        @ship.save
        @item.update(stock: 0)
        redirect_to root_path
      else
        @buy.destroy
        render 'index'
      end
    else
      render 'index'
    end
  end

  def show
    @item = Item.find(params[:id])
    @buy = Buy.find_by(item_id: params[:id])
    user_buy = User.find(@buy.user_id)
    @full_name = "#{user_buy.name_1} #{user_buy.name_2}"
    ship = Ship.find_by(buy_id: @buy.id)
    @full_address = "〒 #{ship.postal}　#{ship.pref.name} #{ship.city} #{ship.number} #{ship.house}"
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def buyer
    redirect_to root_path if @item.user_id == current_user.id
  end

  def sold_item
    redirect_to root_path if @item.stock == false
  end

  def buy_params
    params.require(:buy).permit(
      :token,
      :postal,
      :pref_id,
      :city,
      :number,
      :house,
      :tel
    ).merge(
      user: current_user.id,
      item: @item.id
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end
end

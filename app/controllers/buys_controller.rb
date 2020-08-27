class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  # # before_action :buyer

  def index
    @buy = Buy.new
  # @buy = BuyShip.new は Name Errorになる
  end

  def create
    @buy = Buy.new(
      user_id: buy_params[:user],
      item_id: buy_params[:item]
    )
    @ship = Ship.new(
      postal:  buy_params[:postal],
      pref_id: buy_params[:pref_id],
      city:    buy_params[:city],
      number:  buy_params[:number],
      house:   buy_params[:house]
    )
    if @buy.valid? && @ship.valid?
      pay_item
      @buy.save
      @ship.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  
  private
  
    def set_item
      @item = Item.find(params[:item_id])
    end
  
  def buyer
    if @item.user_id == current_user.id
      redirect_to root_path
    end
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
      user: @item.user_id,
      item: @item.id
    )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp.Charge.create(
      amount: @item.price,
      card: order_params[:token],
      carrency: 'jpy'
    )
  end
end

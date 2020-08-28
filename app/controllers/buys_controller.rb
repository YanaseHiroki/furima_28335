class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :sold_item
  before_action :buyer

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
      user: @item.user_id,
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

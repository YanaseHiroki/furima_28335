class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :buyer

  def new
    @buy = Buy.new
  end

  def create
    @buy = Buy.new(buy_params)
    if @buy.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def buyer
    if @buy.item.user_id == current_user.id
      redirect_to root_path
    end
  end
  
  def buy_params
    params.require(:buy).permit(
      :user,
      :item
    )
  end
end

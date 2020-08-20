class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :find_item, only: [:show, :destroy]

  def index
    @items = Item.all.order(id: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :title,
      :image,
      :description,
      :price,
      :category_id,
      :state_id,
      :charge_id,
      :pref_id,
      :due_id
    ).merge(
      user_id: current_user.id
    )
  end
end

def find_item
  @item = Item.find(params[:id])
end

class ItemsController < ApplicationController
  before_action :authenticate_user!
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
      star:'0',
      user_id:current_user.id
    )
  end
end

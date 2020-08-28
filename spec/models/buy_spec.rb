require 'rails_helper'

RSpec.describe Buy, type: :model do
  before do
    # ユーザーのインスタンスを保存
    @user = FactoryBot.create(:user)
    # 商品のインスタンスを保存
    sleep 2
    @item = FactoryBot.build(:item)
    @item.user_id = @user.id
    @item.image = fixture_file_upload('public/images/test_image.png')
    @item.save
    # 購入のインスタンスを生成
    @buy = Buy.new(user_id: @user.id, item_id: @item.id)
  end
  describe '商品を購入する機能' do
    context '商品購入がうまくいくとき' do
      it 'ユーザーおよび商品と紐付いていれば購入できる' do
        expect(@buy).to be_valid
      end
    end
    context '商品購入がうまくいかないとき' do
      it 'ユーザーと紐付いていなければ購入できない' do
        @buy.user_id = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("User can't be blank")
      end
      it '商品と紐付いていなければ購入できない' do
        @buy.item_id = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

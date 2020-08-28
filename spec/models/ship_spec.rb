require 'rails_helper'

RSpec.describe Ship, type: :model do
  before do
    @user = FactoryBot.create(:user)
    sleep 2
    @item = FactoryBot.build(:item)
    @item.user_id = @user.id
    @item.image = fixture_file_upload('public/images/test_image.png')
    @item.save
    sleep 2
    @buy = Buy.create(user_id: @user.id, item_id: @item.id)
    @ship = FactoryBot.build(:ship)
    @ship.buy_id = @buy.id
  end
  describe '発送先を保存する機能' do
    context '発送先の保存がうまくいくとき' do
      it 'postal, pref_id, city, number, house, tel, buy_idの値があれば発送先を保存できる' do
        expect(@ship).to be_valid
      end
      it 'houseの値は無くても発送先を保存できる' do
        @ship.house = nil
        expect(@ship).to be_valid
      end
    end
    context '発送先の保存がうまくいかないとき' do
      it 'postalの値が無ければ発送先を保存できない' do
        @ship.postal = nil
        @ship.valid?
        expect(@ship.errors.full_messages).to include("Postal can't be blank")
      end
      it 'postalの値に"-"（ハイフン）が無ければ発送先を保存できない' do
        @ship.postal = 7_340_001
        @ship.valid?
        expect(@ship.errors.full_messages).to include('Postal is invalid')
      end
      it 'pref_idの値が無ければ発送先を保存できない' do
        @ship.pref_id = nil
        @ship.valid?
        expect(@ship.errors.full_messages).to include("Pref can't be blank")
      end
      it 'cityの値が無ければ発送先を保存できない' do
        @ship.city = nil
        @ship.valid?
        expect(@ship.errors.full_messages).to include("City can't be blank")
      end
      it 'numberの値が無ければ発送先を保存できない' do
        @ship.number = nil
        @ship.valid?
        expect(@ship.errors.full_messages).to include("Number can't be blank")
      end
      it 'telの値が無ければ発送先を保存できない' do
        @ship.tel = nil
        @ship.valid?
        expect(@ship.errors.full_messages).to include("Tel can't be blank")
      end
      it 'telの値が12桁以上のとき発送先を保存できない' do
        @ship.tel = 111_222_333_444
        @ship.valid?
        expect(@ship.errors.full_messages).to include('Tel is invalid')
      end
      it 'buy_idの値が無ければ発送先を保存できない' do
        @ship.buy_id = nil
        @ship.valid?
        expect(@ship.errors.full_messages).to include("Buy can't be blank")
      end
    end
  end
end

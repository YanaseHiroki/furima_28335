require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.user_id = @user.id
    @item.star = 0
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品を出品できる場合' do
    it '出品画像、商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、価格があれば出品できる' do
      expect(@item).to be_valid
    end
  end

  describe '商品を出品できない場合' do
    it '出品画像が空では出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が空では出品できない' do
      @item.title = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end
    it '商品の説明が空では出品できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it '価格が空では出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'category_idが空では出品できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'カテゴリーを選択しないと出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end
    it 'state_idが空では出品できない' do
      @item.state_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("State can't be blank")
    end
    it '商品の状態を選択しないと出品できない' do
      @item.state_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('State must be other than 1')
    end
    it 'charge_idが空では出品できない' do
      @item.charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Charge can't be blank")
    end
    it '配送料の負担を選択しないと出品できない' do
      @item.charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Charge must be other than 1')
    end
    it 'pref_idが空では出品できない' do
      @item.pref_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Pref can't be blank")
    end
    it '発送元の地域を選択しないと出品できない' do
      @item.pref_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Pref must be other than 1')
    end
    it 'due_idが空では出品できない' do
      @item.due_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Due can't be blank")
    end
    it '発送までの日数を選択しないと出品できない' do
      @item.due_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Due must be other than 1')
    end
  end
end

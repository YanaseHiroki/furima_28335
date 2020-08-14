require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録がうまくいくとき' do

    it 'メールアドレス, パスワード, パスワード（確認）, ニックネーム, 姓, 名, セイ, メイ, 生年月日があれば登録できる' do
      expect(@user).to be_valid
    end

    it '姓, 名が、漢字のとき登録できる' do
      @user.name_1 = '坂本'
      @user.name_2 = '竜馬'
      expect(@user).to be_valid
    end
    
    it '姓, 名が、ひらがなのとき登録できる' do
      @user.name_1 = 'さかもと'
      @user.name_2 = 'りょうま'
      expect(@user).to be_valid
    end
    
    it '姓, 名がカタカナのとき登録できる' do
      @user.name_1 = 'サカモト'
      @user.name_2 = 'リョウマ'
      expect(@user).to be_valid
    end 
    
    it 'セイ, メイがカタカナであれば登録できる' do
      @user.kana_1 = 'サカモト'
      @user.kana_2 = 'リョウマ'
      expect(@user).to be_valid
    end
    
    it 'パスワードが半角ローマ字と半角数字からなる6文字以上であれば登録できる' do
      @user.password = 'abc123'
      @user.password_confirmation = 'abc123'
      expect(@user).to be_valid
    end

    it 'メールアドレスに@が含まれていれば登録できる' do
      @user.email = 'abc@example.com'
      expect(@user).to be_valid
    end
  end
  
  describe 'ユーザー新規登録がうまくいかないとき' do
    
    it 'メールアドレスが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    
    it 'パスワードが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    
    it 'パスワードが5文字以下では登録できない' do
      @user.password = 'abc12'
      @user.password_confirmation = 'abc12'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    
    it 'パスワード（確認）が空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
    it 'ニックネームが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
      
    end
    
    it '姓が空では登録できない' do
      @user.name_1 = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name 1 can't be blank")
      
    end
    it '名が空では登録できない' do
      @user.name_2 = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name 2 can't be blank")      
    end
    
    it 'セイが空では登録できない' do
      @user.kana_1 = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana 1 can't be blank")
      
    end
    
    it 'メイが空では登録できない' do
      @user.kana_2 = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana 2 can't be blank")
      
    end
    
    it '生年月日が空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
      
    end
    it 'emailに一意性がなければ登録できない' do
      @user.save
      user_2 = FactoryBot.build(:user)
      user_2.email = @user.email
      user_2.valid?
      expect(user_2.errors.full_messages).to include("Email has already been taken")
    end
    it 'emailに@が含まれていなければ登録できない' do
      @user.email.delete!('@')
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
  
  end
end
  




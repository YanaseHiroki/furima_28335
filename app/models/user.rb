class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # すべての属性が「空でない」ことを確認
  with_options presence: true do
    validates :nickname, :birthday
    # 一意性と「@があるか」を確認
    validates :email, format: { with: /@.+/ }, uniqueness: true
    # パスワードが英数字混合で構成されているか確認
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze }
    # 文字の種類（ひらがな、カタカナ、漢字）の確認
    validates :name_1, :name_2, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :kana_1, :kana_2, format: { with: /\A[ァ-ン]+\z/ }
  end

  has_many :items
  # has_many :buys
end

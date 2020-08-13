class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # 指定された属性が「空でない」ことを確認
  validates :email, :password,  :nickname,  :name_1,  :name_2,  :kana_1,  :kana_2,  :birthday, presence: true
  # 一意性と「@があるか」を確認
  validates :email, format: { with: /@.+/ }
  validates :email, uniqueness: true
  # ６文字以上か確認
  validates :password, length: { minimum: 6 }
  # 文字の種類（ひらがな、カタカナ、漢字）の確認
  validates :name_1, :name_2,   format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :kana_1, :kana_2,   format: { with: /\A[ァ-ン]+\z/ }

  has_many :items
  # has_many :buys
end

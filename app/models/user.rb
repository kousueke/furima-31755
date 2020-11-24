class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  with_options  presence: true do
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])\w{6,12}\z/
    validates :password, format: { with: VALID_PASSWORD_REGEX}

    validates :nickname
    with_options format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
    }do
    validates :firstname
    validates :lastname
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/}do
    validates :firstname_kana
    validates :lastname_kana
    end
    validates :bithday
  end
end
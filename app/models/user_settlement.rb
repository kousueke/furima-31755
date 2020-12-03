class UserSettlement

  include ActiveModel::Model

  attr_accessor :postalcode, :area_id, :municipality, :address, :buildingname, :tell , :buy, :token
  
  with_options presence: true do
    #tokenのバリデーション
    validates :token
    #住所のバリデーション
    validates :postalcode format: { with: /^\d{7}$/, message: '' } do
    validates :area_id
    validates :municipality
    validates :address
    validates :buildingname
    validates :tell format: { with: /^\d{10}$|^\d{11}$/, message: '' } do
    #buyのバリデーション
    validates :user
    validates :item
  end

  
  def save
    Buy.create(:user, :item)
    Shippingaddress.create(:postalcode, :area_id, :municipality, :address, :buildingname, :tell , :buy)
  end
end


| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### shippingaddress テーブル

| postalcode       | string     | null: false                    |
| area_id          | integer    | null: false                    |
| municipality     | string     | null: false                    |
| address          | string     | null: false                    |
| buildingname     | string     |                                |
| tell             | string     | null: false                    |
| buy              | references | null: false, foreign_key: true |
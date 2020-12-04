class UserSettlement
  include ActiveModel::Model

  attr_accessor :postalcode, :area_id, :municipality, :address, :buildingname, :tell, :token, :user_id, :item_id

  with_options presence: true do
    validates :postalcode, format: { with: /\A\d{3}-\d{4}\z/, message: 'Postal code Input correctly' }
    validates :area_id, numericality: { other_than: 1 }
    validates :municipality
    validates :address
    validates :tell, format: { with: /\A\d{11}\z/, message: 'Phone number Input only number' }

    validates :token
  end

  def save
    buys = Buy.create(user_id: user_id, item_id: item_id)
    Shippingaddress.create(postalcode: postalcode, area_id: area_id, municipality: municipality, address: address, buildingname: buildingname, tell: tell, buy_id: buys.id)
  end
end

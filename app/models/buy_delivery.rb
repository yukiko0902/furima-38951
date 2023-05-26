class BuyDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :municipality , :address, :building_name, :telephone_number, :token 

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :municipality
    validates :address
    validates :telephone_number, format: { with: /\A[0-9]{10,11}+\z/, message: "is invalid" }
    validates :token
  end

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Delivery.create(postcode: postcode, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, telephone_number: telephone_number, buy_id: buy.id)
  end
  
end

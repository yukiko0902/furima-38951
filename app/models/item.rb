class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_to_delivery
  
  validates :image, presence: true
  validates :item_name, presence: true, length: { maximum: 40 }
  validates :description_of_item, presence: true, length: { maximum: 1000 }
  validates :item_category_id, presence: true
  validates :item_state_id, presence: true
  validates :shipping_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :days_to_delivery_id, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

  validates :item_category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :item_state_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_charge_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :days_to_delivery_id, numericality: { other_than: 1 , message: "can't be blank"}   
end


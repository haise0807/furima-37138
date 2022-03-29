class Item < ApplicationRecord
  
    validates :item_name, presence: true
    validates :information,presence: true
    validates :category_id,     numericality: { other_than: 1 , message: "can't be blank" } 
    validates :condition_id,    numericality: { other_than: 1 , message: "can't be blank" } 
    validates :shipping_fee_id, numericality: { other_than: 1 , message: "can't be blank" } 
    validates :prefecture_id,   numericality: { other_than: 1 , message: "can't be blank" } 
    validates :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank" } 
    validates :price,presence: true
    validates :image,presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_day
  has_one_attached :image

end

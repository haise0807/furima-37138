class Item < ApplicationRecord
  with_options presence: true do
    validates :item_name
    validates :information
    validates :image
    validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9_999_999, allow_blank: true }
  end

  validates :category_id,     numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,    numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,   numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" }

  belongs_to :user
  has_one_attached :image
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_day
end

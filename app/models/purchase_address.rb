class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :purchase_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :house_number
    validates :phone_number,  format:{with: /\A\d{10,11}\z/}
  end
  validates :prefecture_id,   numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id )
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number,purchase_id: purchase.id)
  end

  
end
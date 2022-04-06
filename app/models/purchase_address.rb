class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :purchase_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :phone_number
    validates :purchase_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id )
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number,purchase_id: purchase.id)
  end
end
class OrderAddress
  include ActiveModel::Model
  attr_accessor :token , :deli_num , :area_id , :ward , :block , :room , :phone , :user_id , :item_id

  with_options presence: true do
    validates :token
    validates :deli_num, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :ward
    validates :block
    validates :user_id
    validates :item_id
    validates :phone, format: {with: /\A[0-9]{10,11}+\z/}
  end

  def save
    order = Order.create(user_id: user_id , item_id: item_id)
    Address.create(deli_num: deli_num, area_id: area_id, ward: ward, block: block, room: room, phone: phone, order_id: order.id)
  end

end
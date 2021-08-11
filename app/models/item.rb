class Item < ApplicationRecord
  belongs_to :user
  # has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :text
    validates :image
    with_options numericality: { other_than: 1 } do
      validates :area
      validates :category
      validates :charge
      validates :indication
      validates :status
    end
    with_options numericality: { in: 300..9999999 } do
      validates :price
    end
  end
end

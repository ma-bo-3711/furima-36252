class Item < ApplicationRecord
  belongs_to :user
  # has_one :purchase
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :charge
  belongs_to :indication
  belongs_to :status

  with_options presence: true do
    validates :name
    validates :text
    validates :image
    with_options numericality: { other_than: 1 } do
      validates :area_id
      validates :category_id
      validates :charge_id
      validates :indication_id
      validates :status_id
    end
    with_options numericality:  { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 } do
      validates :price
    end
  end
end

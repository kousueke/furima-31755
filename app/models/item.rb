class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :deli_price
  belongs_to :area
  belongs_to :deli_day

  with_options  presence: true do
    validates :name
    validates :explanation
    validates :image
    validates :price
  end

  with_options  numericality: { other_than: 1, message: "Select" } do
    validates :category_id
    validates :status_id
    validates :deli_price_id
    validates :area_id
    validates :deli_day_id
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

end
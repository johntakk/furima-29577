class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :order_history

  has_one_attached :image
  with_options presence: true do
  validates :image
  validates :name
  validates :explanation
  with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :status_id
  validates :delivery_term_id
  validates :delivery_from_id
  validates :delivery_leadtime_id
  end
  validates :price
  validates_inclusion_of :price, in: 300..9999999
  end
  belongs_to :category
  belongs_to :delivery_from
  belongs_to :delivery_leadtime
  belongs_to :status
  belongs_to :delivery_term
  belongs_to :user
  
end

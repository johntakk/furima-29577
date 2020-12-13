class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one_attached :image
  with_options presence: true do
  validates :image
  validates :name
  validates :explanation
  validates :category_id, numericality: { other_than: 1 } 
  validates :status_id, numericality: { other_than: 1 } 
  validates :delivery_term_id, numericality: { other_than: 1 } 
  validates :delivery_from_id, numericality: { other_than: 1 } 
  validates :delivery_leadtime_id, numericality: { other_than: 1 } 
  validates :price
  validates_inclusion_of :price, in: 300..9999999
  end
  belongs_to :category
  belongs_to :delivery_from
  belongs_to :delivery_leadtime
  belongs_to :status
  
end

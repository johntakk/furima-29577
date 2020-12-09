class Item < ApplicationRecord
  has_one_attached :image
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1 } 
  validates :status_id, numericality: { other_than: 1 } 
  validates :delivery_term_id, numericality: { other_than: 1 } 
  validates :delivery_from_id, numericality: { other_than: 1 } 
  validates :delivery_leadtime_id, numericality: { other_than: 1 } 

end

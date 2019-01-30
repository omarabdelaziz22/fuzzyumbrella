class Product < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :favoritelists

  validates :name,  presence: true, uniqueness: true
  validates :price,  presence: true
end

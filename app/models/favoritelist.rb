class Favoritelist < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :products

  validates :name,  presence: true
end

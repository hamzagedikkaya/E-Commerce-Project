class Attribute < ApplicationRecord
  has_many :product_attributes, dependent: :destroy
  has_many :products, through: :product_attributes

  validates :name, presence: true
end

class Product < ApplicationRecord
  belongs_to :subcategory
  belongs_to :brand
  has_many :product_attributes, dependent: :destroy
  has_many :attributes, through: :product_attributes

  validates :name, presence: true
end

class Product < ActiveRecord::Base

  default_scope { order 'created_at DESC' }

  belongs_to :restaurant
  has_many :favourite_products
  scope :last_version, -> { where last_version: true }
end

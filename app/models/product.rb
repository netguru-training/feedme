class Product < ActiveRecord::Base
  default_scope { order 'created_at DESC' }
  belongs_to :restaurant
  has_many :favourite_products
  scope :last_version, -> { where last_version: true }

  def favourite(user_id)
    return true if favourite_products.find_by_user_id(user_id)
    false
  end
end

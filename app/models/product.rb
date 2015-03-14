class Product < ActiveRecord::Base
  default_scope { order 'created_at DESC' }
  
  belongs_to :restaurant
end

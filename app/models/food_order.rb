class FoodOrder < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  has_many :products, through: :order_items

  scope :active, -> { where status: :active }

  def finalize!
    self.status = "closed"
    self.save
  end
end

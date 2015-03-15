class FoodOrder < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  has_many :products, through: :order_items

  default_scope { order 'created_at DESC' }
  scope :active, -> { where status: :active }

  def active?
    status.to_sym == :active
  end

  def finalize!
    self.status = :finalized
    self.finalized_at = Time.now
    self.save
  end

  def deliver!
    self.status = :delivered
    self.delivered_at = Time.now
    self.save
  end
end

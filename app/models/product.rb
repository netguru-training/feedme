class Product < ActiveRecord::Base
  default_scope { order 'created_at DESC' }
  belongs_to :restaurant

  has_many :ratings
  has_many :favourite_products

  scope :last_version, -> { where last_version: true }

  def self.top
    unscoped.joins(:ratings)
      .select("products.id, products.name, products.price, avg(ratings.value) as average_raiting, count(ratings.id) as ratings_count")
      .group("products.id")
      .order("average_raiting DESC, ratings_count DESC")
  end

  def average_rating
    avg = ratings.any? ? ratings.pluck(:value).reduce(:+).to_f / ratings.size : 0.0
    avg.round(2)
  end

  def has_rated?(user)
    ratings.where(user_id: user.id).any?
  end

  def favourite(user_id)
    return true if favourite_products.find_by_user_id(user_id)
    false
  end
end

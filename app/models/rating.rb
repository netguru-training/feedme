class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  scope :top, -> { where value: 5 }

end

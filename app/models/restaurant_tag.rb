class RestaurantTag < ApplicationRecord
  belongs_to :restaurant
  belongs_to :tag

  validates :tag_id, uniqueness: { scope: :restaurant_id}
end

class Restaurant < ApplicationRecord
    has_many :user_restaurants, dependent: :destroy
    has_many :likers, through: :user_restaurants, source: :user

    has_many_attached(:images)

end

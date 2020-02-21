class Restaurant < ApplicationRecord
    has_many :user_restaurants, dependent: :destroy
    has_many :likers, through: :user_restaurants, source: :user

    has_many :restaurant_tags, dependent: :destroy
    has_many :tags, through: :restaurant_tags

    has_many_attached(:images)

    validates :country, presence: true
    validates :state, presence: true
    validates :city, presence: true
    validates :zip_code, presence: true
    validates :address, presence: true, uniqueness: true
    validates :phone_number, presence: true, uniqueness: true
    validates :website, presence: true, uniqueness: true

end

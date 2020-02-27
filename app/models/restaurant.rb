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
    validates :lat, presence: true, uniqueness: true
    validates :lon, presence: true, uniqueness: true
    validates :phone_number, presence: true, uniqueness: true
   

    def tag_names 
        self.tags.map{ |t| t.name }.join(", ")
    end
    
    def tag_names=(rhs) 
        self.tags = rhs.strip.split(/\s*,\s*/).map do |tag_name|
          # Finds the first record with the given attributes, OR 
          # initializes a record (Tag.new) with the given attributes 
          # if one is not found. 
          Tag.find_or_initialize_by(name: tag_name)
        end
    end

end

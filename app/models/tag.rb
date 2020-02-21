class Tag < ApplicationRecord
    has_many :restaurant_tags, dependent: :destroy 
    has_many :restaurants, through: :restaurant_tags 

    validates :name, presence: true, uniqueness: { case_sensitive: false }

   
    before_validation :downcase_name
    
    private 

    def downcase_name 
        # self.name = self.name.downcase!
        # self.name && self.name.downcase!
        self.name&.downcase!
    end
end

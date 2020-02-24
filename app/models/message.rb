class Message < ApplicationRecord
  
  belongs_to :conversation
  belongs_to :sender, class_name: :User

  has_one_attached(:image)

  validates :content, presence: true 

  validate(:no_hey)

  # scope(:recent, lambda { order(created_at: :desc).limit(10) })
  # scope(:recent, -> { order(created_at: :desc).limit(10) })


  private

  def no_hey
      if content&.downcase&.match(/\bhey\b/i) || content&.downcase&.match?(/\bhi\b/i) || content&.downcase&.match?(/\bhello\b/i)
        self.errors.add(:content, "You can't use those word!")
      end
  end
    
end

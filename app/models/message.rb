class Message < ApplicationRecord
  
  belongs_to :conversation, touch: true # update convo timestamp to show when latest message was sent
  belongs_to :sender, class_name: :User

  has_one_attached(:image)

  # validates :content, presence: true 
  # validates :content, presence: true, unless: image.attached?
  # validates :image, presence: true, unless: :content


  validate :image_or_content

 

  validate(:no_hey)

  # scope(:recent, lambda { order(created_at: :desc).limit(num) })
  scope(:recent, ->(num){ order(created_at: :desc).limit(num) })


  private

  def no_hey
      if content&.downcase&.match(/\bhey\b/i) || content&.downcase&.match?(/\bhi\b/i) || content&.downcase&.match?(/\bhello\b/i)
        self.errors.add(:content, "You can't use that word! No 'hey', 'hi', or 'hello'.")
      end
  end

  # def check_file_presence
  #   errors.add(:image, "no file added") unless(image.attached? || content != nil)
  # end

  def image_or_content
    # errors.add(:content, "hellooooo") unless(image.attached? || content == nil)
    # bfgdgf
    errors.add(:content, "image or message should be added") unless(image.attached? || content != "")
  end

    
end

class ConversationSerializer < ActiveModel::Serializer

  class MessageSerializer < ActiveModel::Serializer
    attributes :id, :content, :created_at, :updated_at, :sender, :avatar
    belongs_to :user, key: :sender

    def sender
      UserSerializer.new object.sender
    end
  end
  

  attributes :id, :created_at, :updated_at, :most_recent_message
  has_one :most_recent_message, serializer: MessageSerializer

  # Use the following one if you want to send all messages for each conversation
  has_many :messages

  def most_recent_message
    Message.where(conversation_id: self.object.id).last
  end

end

class Conversation < ApplicationRecord
    # has_many :sender, through: :user_conversations, source: :user
    has_many :user_conversations, dependent: :destroy
    has_many :users, through: :user_conversations
    has_many :messages, dependent: :destroy

    

    def other_participants(current_user)
        @other_participants ||= users.where.not(id: current_user.id) 
    end
    
    # helper_method :other_participants
    
end

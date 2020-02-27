class ApplicationController < ActionController::Base

    def current_class?(test_path)
        if request.path == test_path
            return 'active'
        else
            return ''
        end
    end
    helper_method :current_class?

    helper_method :unchecked_conversations
    def unchecked_conversations
        # @unchecked_messages ||= current_user.conversations.joins("INNER JOIN user_conversations ON (conversations.id = user_conversations.conversation_id) AND (user_conversations.updated_at < conversations.updated_at) AND user_conversation.user_id = ?", current_user.id)
        @unchecked_conversations ||= current_user.user_conversations.joins("INNER JOIN conversations ON (conversations.id = user_conversations.conversation_id) AND user_conversations.updated_at < conversations.updated_at")
    end
end

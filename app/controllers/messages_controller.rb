class MessagesController < ApplicationController
    before_action :find_conversation, only: [:create]

    def create
        message = Message.new message_params
        message.conversation_id = @conversation.id
        message.sender_id = current_user.id
        respond_to do |format|
            if message.save
                # ConversationChannel.broadcast_to(@conversation, content: message)
                ActionCable.server.broadcast "conversation_channel_#{@conversation.id}", message: message 
                flash[:notice]="Message sent 📩"
                format.html { redirect_to @conversation, notice: 'Conversation was successfully created.' }
                format.js 
            else
                flash[:danger] = message.errors.full_messages.join(", ")
                redirect_to @conversation
            end
        end
    end


    private

    def find_conversation
        @conversation = Conversation.find params[:conversation_id]
    end

    def message_params
        params.require(:message).permit(:content, :image)
    end


end

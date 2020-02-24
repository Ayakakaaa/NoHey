class MessagesController < ApplicationController
    before_action :find_conversation, only: [:create]

    def create
        message = Message.new message_params
        message.conversation_id = @conversation.id
        message.sender_id = current_user.id
        respond_to do |format|
            if message.save
                # ConversationChannel.broadcast_to(@conversation, content: message)
                img_url = nil
                if message.image.attached?
                    img_url = url_for(message.image)
                end

                sender_img_url = ActionController::Base.helpers.image_url('icon2.jpeg')
                if current_user.images.attached?
                    sender_img_url = url_for(current_user.images.first)
                else
                    
                end
                ActionCable.server.broadcast "conversation_channel_#{@conversation.id}", message: message, image: img_url, sender_image: sender_img_url
                flash[:notice]="Message sent 📩"
                format.html { redirect_to @conversation, notice: 'Conversation was successfully created.' }
                format.js 
            else
                format.html { redirect_to @conversation, alert: message.errors.full_messages.join(", ") } 
                format.json { render json: @conversation.errors }
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

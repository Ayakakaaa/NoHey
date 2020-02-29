class MessagesController < ApplicationController
    before_action :find_conversation, only: [:create]

    def create
        message = Message.new message_params
        message.conversation_id = @conversation.id
        message.sender_id = current_user.id
        respond_to do |format|
            if message.save
                # update timestamp to show user has checked the convo while sending this message
                @conversation.user_conversations.where(user_id: current_user.id).touch_all

                # ConversationChannel.broadcast_to(@conversation, content: message)
                img_url = nil
                if message.image.attached?
                    img_url = url_for(message.image)
                end
                time_ago = ActionController::Base.helpers.time_ago_in_words(message.created_at)
                sender_img_url = ActionController::Base.helpers.image_url('icon2.jpeg')
                if current_user.images.attached?
                    sender_img_url = url_for(current_user.images.first)
                else
                    
                end
                ActionCable.server.broadcast "conversation_channel_#{@conversation.id}", message: message, image: img_url, sender_image: sender_img_url, time_ago: time_ago
                flash[:notice]="Message sent 📩"
                format.html { redirect_to @conversation, notice: 'Conversation was successfully created.' }
                format.js { render :create, locals: {success: true} }
            else
                format.html { redirect_to @conversation, alert: message.errors.full_messages.join(", ") } 
                format.json { render json: @conversation.errors }
                @message = message
                format.js { render :create, locals: {success: false} }
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

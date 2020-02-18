class Api::V1::ConversationsController < Api::ApplicationController
    before_action :authenticate_user!
    before_action :set_conversation, only: [:show, :edit, :update, :destroy]

    # GET /conversations
    # GET /conversations.json
    def index
        @conversations = current_user.conversations.order(created_at: :desc)
    end

    # GET /conversations/1
    # GET /conversations/1.json
    def show
        if !@conversation.users.where(id: current_user.id).present?
            # Do not render, this user is trying to load someone else's conversation!
            # DANGER
            render json: { status: 401 }, status: 401
        end
    end

    # GET /conversations/1/edit
    def edit
    end

    # POST /conversations
    # POST /conversations.json
    def create
        conversation = Conversation.new(conversation_params)
        if conversation.save
            render json:{ id: conversation.id }
        else
            render json: {errors: conversation.errors}, status: :unprocessable_entity 
        end
    end

    # PATCH/PUT /conversations/1
    # PATCH/PUT /conversations/1.json
    def update
        if @conversation.update(conversation_params)
            render json: { id: @conversation.id}
        else
            render json: {errors: @conversation.errors}, status: :unprocessable_entity 
        end
    end
  

    # DELETE /conversations/1
    # DELETE /conversations/1.json
    def destroy
        @conversation.destroy
        render(json: {status: 200}, status: 200)
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conversation_params
      params.fetch(:conversation, {})
    end
end

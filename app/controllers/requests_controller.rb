class RequestsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_user, only: [:create]
    before_action :find_request, only: [:destroy, :approve, :reject]

    def index
        @requests = current_user.received_requests.where(status: :pending).order("created_at DESC")
    end

    def create
        request = Request.new(
            requester_id: current_user.id, 
            requested_id: @requested_user.id, 
            status: :pending
        )
        if request.save
            conversation = Conversation.create()
            UserConversation.create(conversation_id: conversation.id, user_id: @requested_user.id)
            UserConversation.create(conversation_id: conversation.id, user_id: current_user.id)
            flash[:success] = "Requested to #{@requested_user.first_name}!"
        else 
            flash[:danger] = request.errors.full_messages.join(", ")
        end 
        redirect_to @requested_user     
    end

    def approve
        if current_user != @request.requested
            flash[:danger] = "You can't approve this request!"
            redirect_to root_path
        else
            @request.status = "approved"
            if @request.save
                flash[:success] = "Approved #{@request.requested.first_name}"
                redirect_to @request.requester
            else
                flash[:danger] = "You can't approve this request!"
                redirect_to root_path
            end   
        end
    end

    def reject
        if current_user != @request.requested
            flash[:danger] = "You can't reject this request!"
            redirect_to root_path
        else
            @request.status = "rejected"
            if @request.save
                flash[:success] = "rejected #{@request.requested.first_name}"
                redirect_to @request.requester
            else
                flash[:danger] = "You can't reject this request!"
                redirect_to root_path
            end   
        end
    end

    def destroy
        if @request.destroy
            flash[:success] = "Canceled the request from #{@request.requested.username}."
        else
            flash[:alert] = 'Can`t Cancel this request'
        end
        redirect_to @request.requested
    end

    private

    def find_user
        @requested_user = User.find params[:user_id]
    end

    def find_request
        @request = Request.find_by(id: params[:id])
        if !@request
            redirect_to root_path
        end
    end
end

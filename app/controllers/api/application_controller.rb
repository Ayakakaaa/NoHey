class Api::ApplicationController < ApplicationController
    skip_before_action(:verify_authenticity_token)

    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid


    private 

    def authenticate_user!
        unless current_user.present? 
            render json: { status: 401 }, status: 401
        end
    end


    def record_invalid(error) 
        # {
        #    errors: [
        #        {
        #            type: "ActiveRecord::InvalidRecord",
        #            record_type: "Question",
        #            field: "body",
        #            message: "error message"
        #        }   
        #    ]
        # }
        invalid_record = error.record
        errors = invalid_record.errors.map do |field, message|
            {
                type: error.class.to_s,
                record_type: record.class.to_s,
                field: field,
                message: message
            }
        end

        render(
            json: { status: 422, errors: errors },
            status: 422
        )
    end

end

json.array! @conversations do |conversation|
    json.id conversation.id
    json.updated_at conversation.updated_at
    message = conversation.messages.last
    if message.present?
        json.message do 
            json.id message.id
            json.content message.content
            json.updated_at message.updated_at
            json.sender do
                json.id message.sender.id
                json.first_name message.sender.first_name
                json.username message.sender.username
            end
        end
    end
end
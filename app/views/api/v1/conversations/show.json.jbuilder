json.id @conversation.id
json.updated_at @conversation.updated_at
json.message @conversation.messages.order(updated_at: :asc) do |message|
    json.id message.id
    json.content message.content
    json.image_url message.image if message.image.attached?
    json.updated_at message.updated_at
    json.sender do
        json.id message.sender.id
        json.first_name message.sender.first_name
        json.username message.sender.username
        json.image_url url_for(message.sender.images.last) if message.sender.images.attached?
    end
end
class UserSerializer < ActiveModel::Serializer

  include Rails.application.routes.url_helpers

  attributes(
    :id,
    :first_name, # You can include custom methods to be serialized
    :created_at,
    :updated_at,
    :avatars 
  )

  def avatars
    # has_many_attached :avatars
    # object.avatars_attachments
    object.avatars_attachments.includes(:blob).map do |attachment|
      {
        id: attachment.id,
        name: attachment.name,
        content_type: attachment.blob.filename.to_s,
        url: rails_blob_url(attachment)
      }
    end
  end
end

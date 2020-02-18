class Request < ApplicationRecord
  belongs_to :requester, class_name: :User
  belongs_to :requested, class_name: :User

  

  def users
    User.where(id: requester.id)
    .or(
      User.where(id: requested.id)
    )
  end
  # helper_method :users
end

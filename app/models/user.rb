class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :liked_restaurants, through: :user_restaurants, source: :restaurants
  has_many :user_restaurants, dependent: :destroy

  # requests ive sent
  has_many :sent_requests, class_name: :Request, foreign_key: :requester_id
  # requests ive recieved
  has_many :received_requests, class_name: :Request, foreign_key: :requested_id

  has_many :user_conversations, dependent: :destroy
  has_many :conversations, through: :user_conversations

  has_many :sent_messages, class_name: :Message, foreign_key: :sender_id 

  has_many_attached(:images)


  validates :birth_date, presence: true
  validates :sex, presence: true
  validates :first_name, presence: true
  validates :username, presence: true, uniqueness: true

  # users ive sent requests to
  # has_many :requested_reciever
  # users who have sent requests to me
  # has_many :sender_requests

  # users I am currently connected to (status = approved)
  # has_many :history_contacts

  def age()
    ((Time.zone.now - birth_date.to_time) / 1.year.seconds).floor
  end

  def contacts 
    User.joins("INNER JOIN requests ON (requests.requester_id = users.id OR requests.requested_id = users.id) AND requests.status = 'approved'")
      .where("requests.requester_id = :id OR requests.requested_id = :id", id: id).where.not(id: id).order("updated_at DESC")
  end
  # helper_method :contacts



  

end

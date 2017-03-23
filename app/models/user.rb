class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :replies
  has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
	has_many :received_conversations, class_name: 'Conversation', foreign_key: 'received_id'
	has_many :personal_messages, dependent: :destroy
	has_many :chat_rooms, dependent: :destroy
	has_many :chat_messages, dependent: :destroy	

  def username
    email.split('@')[0].capitalize
  end
end	

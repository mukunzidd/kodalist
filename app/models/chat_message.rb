class ChatMessage < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room
  belongs_to :chat_room
  
  validates :body, presence: true, length: {minimum: 2, maximum: 1000}

  # Action Cable Setup
  after_create_commit { ChatMessageBroadcastJob.perform_later(self) }

  def timestamp
	  created_at.strftime('%H:%M:%S %d %B %Y')
	end

end

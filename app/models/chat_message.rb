class ChatMessage < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room
  belongs_to :chat_room


  def timestamp
	  created_at.strftime('%H:%M:%S %d %B %Y')
	end

end

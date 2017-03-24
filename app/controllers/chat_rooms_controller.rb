class ChatRoomsController < ApplicationController
	def index
		@chat_rooms = ChatRoom.all
	end

	def show
	  @chat_room = ChatRoom.includes(:chat_messages).find(params[:id])
	  @chat_message = ChatMessage.new
	end

	def new
		@chat_room = ChatRoom.new
	end

	def create
		@chat_room = current_user.chat_rooms.build(chat_room_params)
		if @chat_room.save
			flash[:success] = 'Chat Room added!'
			redirect_to chat_rooms_path
		else
			render 'new'
		end
	end

	private

		def chat_room_params
			params.require(:chat_room).permit(:title)
		end
end

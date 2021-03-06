class ConversationsController < ApplicationController
	before_action :set_conversation
	before_action :check_participating!, except: [:index]

	def index
		@conversations = Conversation.participating(current_user).order('updated_at DESC')
		@personal_message = PersonalMessage.new
	end

	def show
	  @personal_message = PersonalMessage.new
	end

	def new
	  redirect_to conversation_path(@conversation) and return if @conversation
	  @personal_message = current_user.personal_messages.build
	end

	private		
			def set_conversation
			  @conversation = Conversation.find_by(id: params[:id])
			end

			def check_participating!
			  redirect_to root_path unless @conversation && @conversation.participates?(current_user)
			end
end

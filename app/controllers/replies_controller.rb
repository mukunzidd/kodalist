class RepliesController < ApplicationController
	before_action :find_post
	before_action :authenticate_user!, only: [:create, :update, :delete]
	def create

		@reply = @post.replies.create(reply_params)
		@reply.user_id = current_user.id if current_user
		@reply.save

		if @reply.save
			redirect_to post_path(@post)
		else
			render 'new'
		end

	end

	def edit
		@reply = @post.replies.find(params[:id])
	end

	def update
		@reply = @post.replies.find(params[:id])

		if @reply.update(reply_params)
			redirect_to post_path(@post)
		else
			render 'edit'
		end
	end

	def destroy
		@reply = @post.replies.find(params[:id])
		@reply.destroy
		redirect_to post_path(@post)
	end

	private

		def reply_params
			params.require(:reply).permit(:body)			
		end

		def find_post
			@post = Post.find(params[:post_id])		
		end
		
end

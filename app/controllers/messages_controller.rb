class MessagesController < ApplicationController
	before_filter :authenticate_user!
	def index
  		@messages_inbox = Message.where('message_to =?',current_user.id)
  		@messages_sent  = Message.where('message_from =?',current_user.id)
  		@messages_unread = @messages_inbox.unread
  	end

  	def show
  		@message = Message.find(params[:id])
  		if !@message.read && current_user.id != @message.message_from
  			@message.read_at = Time.now 
  			@message.read = true
  			@message.save!
  		end
  		render :layout=>false
  	end


    def destroy
      @message = Message.find(params[:id])
      @message.destroy

      @messages_inbox = Message.where('message_to =?',current_user.id)
      @messages_sent  = Message.where('message_from =?',current_user.id)
      @messages_unread = @messages_inbox.unread

      respond_to do |format|
        format.html{redirect_to user_messages_path(current_user.id)}
        format.js
      end
    end
end

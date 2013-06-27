class MessagesController < ApplicationController
	before_filter :authenticate_user!
	def index
  		@messages_inbox = Message.where('message_to =?',current_user.id).order("id desc")
  		@messages_sent  = Message.where('message_from =?',current_user.id).order("id desc")
  		@messages_unread = @messages_inbox.unread.count
  	end

  	def show
  		@message = Message.find(params[:id])
  		if !@message.read
  			@message.read_at = Time.now 
  			@message.read = true
  			@message.save!
  		end
  		render :layout=>false
  	end


    def destroy
      @message = Message.find(params[:id])
      @message.destroy

      @messages_inbox = Message.where('message_to =?',current_user.id).order("id desc")
      @messages_sent  = Message.where('message_from =?',current_user.id).order("id desc")
      @messages_unread = @messages_inbox.unread.count

      respond_to do |format|
        format.html{redirect_to user_messages_path(current_user.id)}
        format.js
      end
    end
    
    def private_message_count
      @messages_unread = Message.where("message_to=?", params[:user_id]).unread.count
      render :json => {:messages_unread => @messages_unread}
    end

end

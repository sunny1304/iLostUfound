class MessagesController < ApplicationController
	before_filter :authenticate_user!
	def index
  		@messages_inbox  = Message.where('message_to =?',current_user.id).kept_by_receiver.order("id desc")
  		@messages_sent   = Message.where('message_from =?',current_user.id).kept_by_sender.order("id desc")
  		@messages_unread = @messages_inbox.unread.count
  	end

  	def show
  		@message = Message.find(params[:id])
  		if !@message.read && @message.message_to.eql?(current_user.id)
  			@message.read_at = Time.now 
  			@message.read    = true
  			@message.save!
  		end
  		render :layout=>false
  	end


    def destroy
      @message = Message.find(params[:id])
      if @message.message_to.eql?(current_user.id)
        @message.delete_by_receiver = true
        @message.save
        logger.debug @message.delete_by_receiver
      end
      
      if @message.message_from.eql?(current_user.id)
        @message.delete_by_sender = true
        @message.save
        logger.debug @message.delete_by_sender
      end

      @messages_inbox = Message.where('message_to =?',current_user.id).kept_by_receiver.order("id desc")
      @messages_sent  = Message.where('message_from =?',current_user.id).kept_by_sender.order("id desc")
      @messages_unread = @messages_inbox.unread.kept_by_receiver.count

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

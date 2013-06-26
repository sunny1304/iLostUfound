class LostItemsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index,:show]
  # GET /lost_items
  # GET /lost_items.json
  def index
    @lost_items_top = LostItem.where("user_id IS NOT NULL").not_found.count
    @lost_items = LostItem.where("user_id IS NOT NULL").not_found.order('id desc').page(params[:page]).per(10)
    
    respond_to do |format|
      format.js
      format.html # index.html.erb
      format.json { render json: @lost_items }
    end
  end

  # GET /lost_items/1
  # GET /lost_items/1.json
  def show
    # @lost_item = LostItem.where("id =? AND user_id =?",params[:id],params[:user_id])
    @lost_item = LostItem.find(params[:id])

    @comments = @lost_item.comments.where("user_email IS NOT NULL").order("id DESC").page(params[:page]).per(7)
    respond_to do |format|
      format.js
      format.html # show.html.erb
      format.json { render json: @lost_item }
    end
  end

  # GET /lost_items/new
  # GET /lost_items/new.json
  def new
    # @lost_item = LostItem.new
    @lost_item = current_user.lost_items.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lost_item }
    end
  end

  # GET /lost_items/1/edit
  def edit
    if user_lost_items.include?(params[:id].to_i)
      @lost_item = current_user.lost_items.find(params[:id])
      if @lost_item.found
        redirect_to lost_items_path, :notice => "This report is closed, you can not edit it."
        return
      end
    else
      redirect_to lost_items_path,:alert => "You are not allowed to edit others report"
      return
    end
  end

  # POST /lost_items
  # POST /lost_items.json
  def create
    @lost_item = current_user.lost_items.build(params[:lost_item])
    @lost_item.ip_address = request.ip
    # @lost_item.user_id = current_user.id
    # logger.debug @lost_item.inspect
    respond_to do |format|
      if @lost_item.save
        # LostFound.lost_notification(@lost_item).deliver
        format.html { redirect_to user_lost_item_path(current_user,@lost_item),notice: 'Lost item was successfully created.' }
        format.json { render json: @lost_item, status: :created, location: @lost_item }
      else
        format.html { render action: "new" }
        format.json { render json: @lost_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lost_items/1
  # PUT /lost_items/1.json
  def update
    @lost_item = current_user.lost_items.find(params[:id])

    respond_to do |format|
      if @lost_item.update_attributes(params[:lost_item])
        # LostFound.lost_notification(@lost_item).deliver
        format.html { redirect_to user_lost_item_path(current_user,@lost_item), notice: 'Lost item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lost_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lost_items/1
  # DELETE /lost_items/1.json
  def destroy
    @lost_item = LostItem.find(params[:id])
    @lost_item.destroy

    respond_to do |format|
      format.html { redirect_to lost_items_url }
      format.json { head :no_content }
    end
  end

  def user_lost_items
    current_user.lost_items.collect(&:id)
  end

  def comments
    if params[:content].present? && params[:user_id].present?
      if request.request_method.eql?("POST")
        user = User.find(params[:user_id])
        comment = Comment.create(:content => params[:content], :commentable_id => params[:id].to_i, :commentable_type => 'LostItem',:user_email => user.email, :user_id => user.id)
      # comment.save
      end
      # logger.debug request.request_method
    end
      @comments = LostItem.find(params[:id]).comments.where("user_email IS NOT NULL").order("id DESC").page(params[:page]).per(7)
      # logger.debug @comments.inspect
    respond_to do |format|
      format.html{redirect_to user_lost_item_path(current_user,params[:id])}
      format.js
    end
    # render :nothing => true
  end

  def lock_item 
    if params[:found].present? && params[:item].present?
      if params[:found] == "1"
        @lost_item = LostItem.find(params[:item])
        if @lost_item.present?
          @lost_item.update_attributes(:found => true)
        end
      end
    end
    @lost_item = LostItem.find(params[:item])
    respond_to do |format|
      format.js
    end
  end

  def reply
    if params[:user_id].present? && params[:comment_id].present? && params[:reply].present?
      @reply = Reply.create(:reply => params[:reply], :user_id => params[:user_id].to_i, :comment_id => params[:comment_id].to_i)
    end
    @comment = Comment.find(params[:comment_id])
    @replies = @comment.replies

    respond_to do |format|
      format.html{redirect_to user_lost_item_path(current_user,params[:id])}
      format.js
    end
  end

  def private_message
    logger.debug params.inspect
    logger.debug "addtional info#{current_user.id}"
    @message = Message.create(:subject => params[:subject], :body => params[:private_message_body], :message_from => current_user.id, :message_to => params[:reporter_id], :commentable_id => params[:id].to_i) 
    if @message.save
      logger.debug "Saved"
    end
    respond_to do |format|
      format.js
    end
  end

end

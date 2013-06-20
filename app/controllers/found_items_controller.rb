class FoundItemsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index,:show]
  # GET /found_items
  # GET /found_items.json
  def index
    @found_items = FoundItem.where("user_id IS NOT NULL").order('id').page(params[:page]).per(10)

    respond_to do |format|
      format.js
      format.html # index.html.erb
      format.json { render json: @found_items }
    end
  end

  # GET /found_items/1
  # GET /found_items/1.json
  def show
    @found_item = FoundItem.find(params[:id])

    @comments = @found_item.comments.where("user_email IS NOT NULL").order("id DESC").page(params[:page]).per(7)
    respond_to do |format|
      format.js
      format.html # show.html.erb
      format.json { render json: @found_item }
    end
  end

  # GET /found_items/new
  # GET /found_items/new.json
  def new
    @found_item = current_user.found_items.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @found_item }
    end
  end

  # GET /found_items/1/edit
  def edit
    if user_found_items.include?(params[:id].to_i)
      @found_item = current_user.found_items.find(params[:id])
    else
      redirect_to found_items_path,:notice => "You can not edit others report"
      return
    end
  end

  # POST /found_items
  # POST /found_items.json
  def create
    @found_item = current_user.found_items.build(params[:found_item])
    @found_item.ip_address = request.ip

    respond_to do |format|
      if @found_item.save
        # LostFound.find_notification(@found_item).deliver
        format.html { redirect_to user_found_item_path(current_user,@found_item), notice: 'Found item was successfully created.' }
        format.json { render json: @found_item, status: :created, location: @found_item }
      else
        format.html { render action: "new" }
        format.json { render json: @found_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /found_items/1
  # PUT /found_items/1.json
  def update
    @found_item = current_user.found_items.find(params[:id])

    respond_to do |format|
      if @found_item.update_attributes(params[:found_item])
        format.html { redirect_to :controller => 'search', :action => 'suggestion' ,:id => @found_item.id, notice: 'Found item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @found_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /found_items/1
  # DELETE /found_items/1.json
  def destroy
    @found_item = FoundItem.find(params[:id])
    @found_item.destroy

    respond_to do |format|
      format.html { redirect_to found_items_url }
      format.json { head :no_content }
    end
  end

  def user_found_items
    current_user.found_items.collect(&:id)
  end

  def comments
    if params[:content].present? && params[:user_id].present?
      if request.request_method.eql?("POST")
        user = User.find(params[:user_id])
        comment = Comment.create(:content => params[:content], :commentable_id => params[:id].to_i, :commentable_type => 'FoundItem',:user_email => user.email, :user_id => user.id)
        # logger.debug ".....true....." if comment.save 
      end
    end
      @comments = FoundItem.find(params[:id]).comments.where("user_email IS NOT NULL").order("id DESC").page(params[:page]).per(7)

    respond_to do |format|
      format.html{redirect_to user_found_item_path(current_user,params[:id])}
      format.js
    end
  end

end

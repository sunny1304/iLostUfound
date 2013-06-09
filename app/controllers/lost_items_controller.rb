class LostItemsController < ApplicationController
  # GET /lost_items
  # GET /lost_items.json
  def index
    @lost_items = LostItem.all
    # raise cookies.to_yaml
    logger.debug cookies.inspect
    logger.debug request.ip
    logger.debug request.remote_ip
    logger.debug request.uuid
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lost_items }
    end
  end

  # GET /lost_items/1
  # GET /lost_items/1.json
  def show
    @lost_item = LostItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lost_item }
    end
  end

  # GET /lost_items/new
  # GET /lost_items/new.json
  def new
    @lost_item = LostItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lost_item }
    end
  end

  # GET /lost_items/1/edit
  def edit
    @lost_item = LostItem.find(params[:id])
  end

  # POST /lost_items
  # POST /lost_items.json
  def create
    @lost_item = LostItem.new(params[:lost_item])
    @lost_item.ip_address = request.ip

    respond_to do |format|
      if @lost_item.save
        # LostFound.lost_notification(@lost_item).deliver
        format.html { redirect_to @lost_item, notice: 'Lost item was successfully created.' }
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
    @lost_item = LostItem.find(params[:id])

    respond_to do |format|
      if @lost_item.update_attributes(params[:lost_item])
        format.html { redirect_to @lost_item, notice: 'Lost item was successfully updated.' }
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
end

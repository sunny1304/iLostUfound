class FoundItemsController < ApplicationController
  # GET /found_items
  # GET /found_items.json
  def index
    @found_items = FoundItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @found_items }
    end
  end

  # GET /found_items/1
  # GET /found_items/1.json
  def show
    @found_item = FoundItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @found_item }
    end
  end

  # GET /found_items/new
  # GET /found_items/new.json
  def new
    @found_item = FoundItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @found_item }
    end
  end

  # GET /found_items/1/edit
  def edit
    @found_item = FoundItem.find(params[:id])
  end

  # POST /found_items
  # POST /found_items.json
  def create
    @found_item = FoundItem.new(params[:found_item])

    respond_to do |format|
      if @found_item.save
        format.html { redirect_to @found_item, notice: 'Found item was successfully created.' }
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
    @found_item = FoundItem.find(params[:id])

    respond_to do |format|
      if @found_item.update_attributes(params[:found_item])
        format.html { redirect_to @found_item, notice: 'Found item was successfully updated.' }
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
end

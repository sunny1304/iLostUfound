class SearchController < ApplicationController
  def lost
    if params[:search].present?
      # @search = LostItem.search do
      #   fulltext params[:search]
      #   paginate :page => params[:page], :per_page => 10
      # end

      # @lost_items = @search.results
      # # logger.debug "_________#{@search.inspect}_________"

      @lost_items = LostItem.where("(lost_item ILIKE ?) OR (lost_location ILIKE ?)","%#{params[:search]}%","%#{params[:search]}%").page(params[:page]).per(10)
    end

  	respond_to do |format|
  		format.html #lost.html.haml
  		format.js
  	end
  end

  def found
    if params[:search].present?
      search_term = params[:search].chomp
      @found_items = FoundItem.where("(found_item ILIKE ?) OR (found_location ILIKE ?)","%#{search_term}%","%#{search_term}%").page(params[:page]).per(10)
    end
    respond_to do |format|
      format.js
      format.html #found.html.haml
    end
  end
  

  def suggestion
    if params[:id].present?
      found_item = FoundItem.find(params[:id].to_i)
      @suggestion_items = LostItem.where("(lost_item ILIKE ? ) OR (lost_location ILIKE ?)","%#{found_item.found_item}%", "%#{found_item.found_location}%")
      @notice = params[:notice] if params[:notice].present?
    end
  end
end

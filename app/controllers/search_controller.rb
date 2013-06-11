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
  end
end

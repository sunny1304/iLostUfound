class SearchController < ApplicationController
  def lost
    if params[:search].present?
      @search = LostItem.search do
        fulltext params[:search]
        paginate :page => params[:page], :per_page => 10
      end

      @lost_items = @search.results
      # logger.debug "_________#{@search.inspect}_________"
    end

  	respond_to do |format|
  		format.html #lost.html.haml
  		format.js
  	end
  end

  def found
  end
end

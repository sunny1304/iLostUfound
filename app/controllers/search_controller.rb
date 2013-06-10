class SearchController < ApplicationController
  def lost
  	if params[:lost_item].present?
  		@lost_items = LostItem.where("lost_item LIKE ?","%#{params[:lost_item]}%").page(params[:page]).per(10)
  	end
  	respond_to do |format|
  		format.html #lost.html.haml
  		format.js
  	end
  end

  def found
  end
end

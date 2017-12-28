class StocksController < ApplicationController

	def search
		if params[:stock].blank?
			flash.now[:danger] = "Search field cannot be empty"
		else
			@stock = Stock.new_from_lookup(params[:stock])
			flash.now[:danger] = "You must enter a valid symbol" unless @stock
		end
		respond_to do |format|
			format.js { render partial: 'users/result'}
		end
	end
end
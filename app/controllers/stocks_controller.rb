class StocksController < ApplicationController

	def search
		if params[:stock].present?
			@stock = Stock.new_from_lookup(params[:stock])
			if @stock
				render partial: 'users/result'
			else
				flash[:danger] = "You must enter a valid symbol"
				redirect_to my_portfolio_path
			end
		else
			flash[:danger] = "You must enter a ticker symbol"
		end
	end

end
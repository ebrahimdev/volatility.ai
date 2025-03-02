class StocksController < ApplicationController
  def show
    binding.break
    @stock = Stock.find(params[:id])
  end
end

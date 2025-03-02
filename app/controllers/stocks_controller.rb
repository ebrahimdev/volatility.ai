class StocksController < ApplicationController
  def show
    @stock = Stock.find_by(id: params[:id]) || Stock.last
  end

  def pull_stock_data
    PullStockDataJob.perform_later(params[:ticker])
  end
end

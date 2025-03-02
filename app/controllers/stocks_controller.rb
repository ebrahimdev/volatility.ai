class StocksController < ApplicationController
  def show
    @stock_series = Stock.where(ticker: params[:ticker])
  end

  def pull_stock_data
    PullStockDataJob.perform_later(params[:ticker])
  end
end

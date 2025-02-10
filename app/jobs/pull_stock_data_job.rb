class PullStockDataJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Rails.logger.info("Pulling stock data for #{args.first}")
    return if args.empty?

    ticker = args.first
    Stocks::FetchData.call(ticker: ticker)
  end
end

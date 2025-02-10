require "test_helper"

class PullStockDataJobTest < ActiveJob::TestCase
  test "pull stock data job" do
    ticker = "AAPL"
    PullStockDataJob.perform_later(ticker)
    assert_enqueued_with(job: PullStockDataJob, args: [ticker])
  end
end

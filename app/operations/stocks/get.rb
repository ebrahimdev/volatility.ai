module Stocks
  class Get
    def self.call(ticker:)
      Stock.where(ticker: ticker).order(date: :desc).limit(365)
    end
  end
end

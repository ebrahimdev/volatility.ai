require 'avantage'

module Stocks
  class FetchData
    def self.call(ticker:)
      client = Avantage::Client.new(
        key: Rails.application.credentials.dig(:alpha_vantage, :api_key)
      )

      latest_stock = Stock.where(ticker: ticker).order(date: :desc).first
      
      outputsize = if latest_stock.nil? || latest_stock.date < 100.days.ago.to_date
        'full'
      else
        'compact' 
      end
      
      response = client.get('TIME_SERIES_DAILY', {
        symbol: ticker,
        outputsize: outputsize,
        datatype: 'json'
      })

      daily_data = response['Time Series (Daily)']

      latest_date = latest_stock&.date || Date.new(1900)
      
      daily_data.each do |date, values|
        parsed_date = Date.parse(date)
        next if parsed_date <= latest_date
        
        Stock.create!(
          ticker: ticker,
          date: parsed_date,
          open: values['1. open'].to_f,
          high: values['2. high'].to_f,
          low: values['3. low'].to_f,
          close: values['4. close'].to_f,
          volume: values['5. volume'].to_i
        )
      end
    end
  end
end

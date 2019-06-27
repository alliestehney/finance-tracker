class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  def self.new_from_lookup(ticker_symbol)
    # construct a new stock object and send back to who is calling it
    begin
      StockQuote::Stock.new(api_key: 'API KEY')
      looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
      price = looked_up_stock.latest_price
      new(name: looked_up_stock.company_name, ticker: looked_up_stock.symbol, last_price: price)
    rescue Exception => e
      return nil
    end
  end

  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end

end

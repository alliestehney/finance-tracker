class Stock < ApplicationRecord

  def self.new_from_lookup(ticker_symbol)
    # construct a new stock object and send back to who is calling it
    begin
      looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
      price = looked_up_stock.latest_price
      new(name: looked_up_stock.company_name, ticker: looked_up_stock.symbol, last_price: price)
    rescue Exception => e
      return nil
    end
  end

  # def self.strip_commas(number)
  #   number.gsub(",", "")
  # end
end

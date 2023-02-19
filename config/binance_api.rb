require 'binance_api'
class BinanceApi
  def btc
    stream = BinanceAPI::Stream.new(['btcbusd@trade'], on_message: ->(msg) { puts "message: #{msg.data}" })
    byebug
    ss = stream.start
  end
end

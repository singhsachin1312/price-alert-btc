module BinanceApi
  class Stream
    BASE_ENDPOINT = 'wss://stream.binance.com:9443/'.freeze

    def initialize(endpoints, on_open: nil, on_close: nil, on_error: nil, on_message: nil)
      raise 'on_open can accept a block only' if !on_open.nil? && !on_open.is_a?(Proc)
      raise 'on_close can accept a block only' if !on_close.nil? && !on_close.is_a?(Proc)
      raise 'on_error can accept a block only' if !on_error.nil? && !on_error.is_a?(Proc)
      raise 'on_data can accept a block only' if !on_message.nil? && !on_message.is_a?(Proc)

      @endpoints = Array(endpoints).reject(&:nil?).reject(&:empty?)
      raise 'endpoints cannot be empty' if @endpoints.empty?

      @on_open = on_open
      @on_close = on_close
      @on_error = on_error
      @on_message = on_message
      @stream_type = @endpoints.length > 1 ? :combined : :single
    end
  end
end


class ApplicationController < ActionController::API
  include JsonWebToken

  before_action :authenticate_request
  # before_action :btc

  def btc
    stream = BinanceAPI::Stream.new(['btcbusd@trade'], on_message: ->(msg) { puts "message: #{msg.data}" })
    ss = stream.start
    byebug
  end

  private
    def authenticate_request
      header = request.headers['token']
      header = header.split(" ").last if header
      decoded = jwt_decode(header)
      if decoded.present?
        @current_user = User.find(decoded[:user_id])
      else
        return render json: {error: 'Invalid Token'}, status: 401
      end
    end

end
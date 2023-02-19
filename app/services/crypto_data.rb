class CryptoData

  def fetch_data
    result = HTTParty.get("https://api.coingecko.com/api/v3/coins/markets?vs_currency=USD&order=market_cap_desc&per_page=100&page=1&sparkline=false")
    response = result.parsed_response
    if response.present?
      btc_data = response.select{|x| x['id'] == 'bitcoin'}
      Alert.created_alerts.each do |alert|
        if alert.price.to_i == 2753 #btc_data[0]['current_price']
          AlertMailer.alert_user(alert).deliver_now
        end
      end
    end
  end
end

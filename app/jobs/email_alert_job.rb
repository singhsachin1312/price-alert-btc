class EmailAlertJob < ApplicationJob
  queue_as :default

  def perform
    CryptoData.new.fetch_data
  end
end

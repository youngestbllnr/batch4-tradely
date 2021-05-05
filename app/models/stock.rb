class Stock < ApplicationRecord
  has_many :brokers_stocks, dependent: :destroy
  has_many :users, through: :broker_stocks
  has_many :buyers_stocks, dependent: :destroy
  has_many :users, through: :buyer_stocks
  has_many :transactions, through: :buyer_stocks

  def self.list
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex[:publishable_token],
      secret_token: Rails.application.credentials.iex[:secret_token],
      endpoint: 'https://cloud.iexapis.com/v1'
    )

    client.stock_market_list(:mostactive)
  end
end

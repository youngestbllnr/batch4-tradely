IEX::Api.configure do |config|
  config.publishable_token = ENV["IEX_PUBLISHABLE_TOKEN"]
  config.secret_token = ENV["IEX_SECRET_TOKEN"]
  config.endpoint = 'https://cloud.iexapis.com/v1'
end
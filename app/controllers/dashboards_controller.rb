class DashboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :unless_admin, only: :admin
  before_action :unless_broker, only: :broker
  before_action :unless_buyer, only: :buyer

  def buyer
    @stocks = BrokersStock.all
  end

  def broker
    unless cookies[:cached]
      @market = Stock.list
      @market.each do |stock|
        saved = Stock.find_by(symbol: stock.symbol)
        if saved.present?
          unless saved.price == stock.latest_price
            latest_price = stock.latest_price
            change = stock.change_percent_s

            saved.update(price: latest_price, change: change)
          end
        else
          Stock.create(symbol: stock.symbol, name: stock.company_name, price: stock.latest_price, change: stock.change_percent_s)
        end
      end
    end
    @stocks = Stock.all
    @brokers_stocks = BrokersStock.where(user_id: current_user.id)
    cookies[:cached] = true if cookies[:cached].nil?
  end

  def admin; end
end

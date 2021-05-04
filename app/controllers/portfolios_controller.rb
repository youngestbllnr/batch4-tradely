class PortfoliosController < ApplicationController
  before_action :authenticate_user!
  before_action :unless_broker, only: :broker
  before_action :unless_buyer, only: :buyer

  def buyer
    @stocks = BuyersStock.where(user_id: current_user.id)
  end

  def broker
    @stocks = BrokersStock.where(user_id: current_user.id)
  end
end

class DashboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :unless_admin, only: :admin
  before_action :unless_broker, only: :broker
  before_action :unless_buyer, only: :buyer

  def buyer
    @stocks = BrokersStock.all
  end

  def broker
    @stocks = Stock.list
  end

  def admin; end
end

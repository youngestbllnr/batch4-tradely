class BrokersController < ApplicationController
  before_action :unless_admin

  # GET /brokers
  def index
    @brokers = User.all.where(role: 'broker')
    @brokers = @brokers.order('id DESC')
    counts(@brokers)
    @brokers = @today if params[:period] == 'today'
    @brokers = @this_week if params[:period] == 'this_week'
    @brokers = @this_month if params[:period] == 'this_month'
  end

  # GET /brokers/pending
  def pending
    @pending_brokers = User.all.where(role: 'pending_broker')
    @pending_brokers = @pending_brokers.order('id DESC')
    counts(@pending_brokers)
    @pending_brokers = @today if params[:period] == 'today'
    @pending_brokers = @this_week if params[:period] == 'this_week'
    @pending_brokers = @this_month if params[:period] == 'this_month'
  end

  # POST /brokers/approve
  def approve
    @broker = User.find(params[:id])
    @broker.update(role: 'broker')
    flash[:success] = 'Broker was successfully approved.'
    redirect_to pending_brokers_path
  end
end

class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :unless_admin, only: :admin
  before_action :unless_broker, only: :broker
  before_action :unless_buyer, only: :buyer

  def new
    @transaction = Transaction.new
    @broker = User.find(params[:broker_id])
    @stock = Stock.find(params[:stock_id])
  end

  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        create_or_update_buyers_stock(@transaction)
        format.html { redirect_to buyer_dashboard_path, notice: 'Transaction was successful.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def buyer
    @transactions = Transaction.where(user_id: current_user.id)
    @transactions = @transactions.order('id DESC')
    counts(@transactions)
    @transactions = @today if params[:period] == 'today'
    @transactions = @this_week if params[:period] == 'this_week'
    @transactions = @this_month if params[:period] == 'this_month'
  end

  def broker
    @transactions = Transaction.where(broker_id: current_user.id)
    @transactions = @transactions.order('id DESC')
    counts(@transactions)
    @transactions = @today if params[:period] == 'today'
    @transactions = @this_week if params[:period] == 'this_week'
    @transactions = @this_month if params[:period] == 'this_month'
  end

  def admin
    @transactions = Transaction.all
    @transactions = @transactions.order('id DESC')
    counts(@transactions)
    @transactions = @today if params[:period] == 'today'
    @transactions = @this_week if params[:period] == 'this_week'
    @transactions = @this_month if params[:period] == 'this_month'
  end

  private

  def transaction_params
    params.require(:transaction).permit(:user_id, :stock_id, :broker_id, :price, :units)
  end

  def create_or_update_buyers_stock(transaction)
    buyers_stocks = BuyersStock.where(user_id: current_user.id)
    if buyers_stocks.where(stock_id: transaction.stock_id).present?
      buyers_stock = buyers_stocks.find_by(stock_id: transaction.stock_id)
      new_units = buyers_stock.units + transaction.units
      buyers_stock.update(price: transaction.price, units: new_units)
    else
      BuyersStock.create(user_id: transaction.user.id, stock_id: transaction.stock.id, broker_id: transaction.broker_id, price: transaction.price, units: transaction.units)
    end
  end
end

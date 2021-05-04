class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :unless_admin, only: :admin
  before_action :unless_broker, only: :broker
  before_action :unless_buyer, only: :buyer

  def buyer
    @transactions = Transaction.where(user_id: current_user.id)
  end

  def broker
    @transactions = Transaction.where(broker_id: current_user.id)
  end

  def admin
    @transactions = User.all.where(role: 'transaction')
    @transactions = @transactions.order('id DESC')
    counts(@transactions)
    @transactions = @today if params[:period] == 'today'
    @transactions = @this_week if params[:period] == 'this_week'
    @transactions = @this_month if params[:period] == 'this_month'
  end
end

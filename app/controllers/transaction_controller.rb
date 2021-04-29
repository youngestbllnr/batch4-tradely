class TransactionController < ApplicationController
  def create

    @brokers_stock = Stock.new(brokers_stock_params)
    @project = Stock.find_by_symbol(@brokers_stock.symbol)
      if @project
        flash[:success] = "already exist"
        redirect_to(broker_dashboard_path)
      elsif
        @brokers_stock.save
        flash[:success] = "success"
        redirect_to(broker_dashboard_path)
      end
  end
  
  def sell_it
    @brokers_stock = Stock.update(on_sale: params[:on_sale])  
    redirect_to(portfolio_path) 
    flash[:success] = "Succeddfully Sell it"
  end

  
  private

  def brokers_stock_params
    params.permit(:symbol, :company_name, :current_price, :change, :previous_close, :user_id)
  #   symbol: params[:symbol],company: params[:company],current_Price: params[:current_Price], change: params[:change], previous_close: params[:previous_close] , user_id: params[:user_id]
  end
end

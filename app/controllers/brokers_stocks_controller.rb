class BrokersStocksController < ApplicationController
  # POST /brokers_stocks
  def create
    stock = Stock.find(params[:stock_id])
    if stock.present?
      if BrokersStock.where(stock_id: stock.id).present?
        flash[:danger] = "#{params[:stock_symbol]} has already been added to your portfolio"
      else
        BrokersStock.create(user_id: current_user.id, stock_id: stock.id)
        flash[:success] = "#{params[:stock_symbol]} has been added to your portfolio."
      end
    else
      flash[:danger] = 'Invalid request, stock does not exist.'
    end
    redirect_to broker_dashboard_path
  end

  # DELETE /brokers_stocks/1
  def destroy
    brokers_stock = BrokersStock.find(params[:id])
    if brokers_stock.user_id == current_user.id
      brokers_stock.destroy
      respond_to do |format|
        format.html { redirect_to broker_portfolio_path, notice: "#{brokers_stock.stock.symbol} was successfully removed from your portfolio." }
        format.json { head :no_content }
      end
    else
      flash[:danger] = 'Restricted Access.'
      redirect_to broker_dashboard_path
    end
  end
end

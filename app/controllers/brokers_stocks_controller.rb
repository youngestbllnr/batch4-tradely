class BuyersStocksController < ApplicationController
  # DELETE /brokersstocks/1
  def destroy
    brokers_stock = BuyersStock.find(id: params[:id])
    if brokers_stock.broker_id == current_user.id
      brokers_stock.destroy
      respond_to do |format|
        format.html { redirect_to broker_dashboard_path, notice: "#{brokers_stock.stock.symbol} was successfully removed from your portfolio." }
        format.json { head :no_content }
      end
    else
      flash[:danger] = 'Restricted Access.'
      redirect_to broker_dashboard_path
    end
  end
end

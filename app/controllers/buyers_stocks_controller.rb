class BuyersStocksController < ApplicationController
  # DELETE /buyersstocks/1
  def destroy
    buyers_stock = BuyersStock.find(params[:id])
    if buyers_stock.user_id == current_user.id
      Transaction.create(category: 'sell', user_id: buyers_stock.user.id, stock_id: buyers_stock.stock.id, broker_id: buyers_stock.broker_id, price: buyers_stock.price, units: buyers_stock.units)
      buyers_stock.destroy
      respond_to do |format|
        format.html { redirect_to buyer_portfolio_path, notice: "#{buyers_stock.stock.symbol} was successfully removed from your portfolio." }
        format.json { head :no_content }
      end
    else
      flash[:danger] = 'Restricted Access.'
      redirect_to buyer_dashboard_path
    end
  end
end

class BuyersStocksController < ApplicationController
  # DELETE /buyersstocks/1
  def destroy
    buyers_stock = BuyersStock.find(id: params[:id])
    if buyers_stock.buyer_id == current_user.id
      buyers_stock.destroy
      respond_to do |format|
        format.html { redirect_to buyer_dashboard_path, notice: "#{buyers_stock.stock.symbol} was successfully removed from your portfolio." }
        format.json { head :no_content }
      end
    else
      flash[:danger] = 'Restricted Access.'
      redirect_to buyer_dashboard_path
    end
  end
end

class BuyersStockController < ApplicationController
      def show
        @stock = api(params[:id])
      end
    
    #   def new
    #     @stock = api(params[:id])
    #     @buyers_stock = BuyersStock.new
    #   end
    
      def create
        @buyers_stock = BuyersStock.new(buyers_stock_params)
        @transactions = Transaction.new(user_id: params[:user_id])
          if @buyers_stock.save && @transactions.save
          end
      end
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_buyers_stock
          @buyers_stock = current_user.role == "buyer"
        end
    
    #     # Only allow a list of trusted parameters through.
        def buyers_stock_params
          params.permit(:symbol, :company, :current_Price, :change, :previous_close,:buy_date, :user_id)
        #   symbol: params[:symbol],company: params[:company],current_Price: params[:current_Price], change: params[:change], previous_close: params[:previous_close] , user_id: params[:user_id]
        end
end
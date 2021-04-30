class BuyersStockController < ApplicationController
      def show

        
      end
      
      def portfolio
        @broker_stock = Stock.joins("LEFT OUTER JOIN buyers_stocks ON stocks.id = buyers_stocks.stock_id")
      end

      def transactions
        @transac = BuyersStock.joins("LEFT OUTER JOIN stocks ON stocks.id = buyers_stocks.stock_id")
      end
    
    #   def new
    #     @stock = api(params[:id])
    #     @buyers_stock = BuyersStock.new
    #   end
    
      def create
        @buyers_stock = BuyersStock.new(buyers_stock_params)
          if @buyers_stock.save
            flash[:success] = "Succeddfully bought"
            redirect_to(buyer_dashboard_path)
          end
      end
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_buyers_stock
          @buyers_stock = current_user.role == "buyer"
        end
    
    #     # Only allow a list of trusted parameters through.
        def buyers_stock_params
          params.permit(:unit, :user_id, :stock_id)
        #   symbol: params[:symbol],company: params[:company],current_Price: params[:current_Price], change: params[:change], previous_close: params[:previous_close] , user_id: params[:user_id]
        end
end

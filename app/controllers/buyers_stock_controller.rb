class BuyersStockController < ApplicationController
      def show
        @stock = api(params[:id])
      end

      def portfolio
        @stock = BuyersStock.where(user_id: current_user.id)
      end

      def transactions
        # Author.joins("INNER JOIN posts ON posts.author_id = author.id AND posts.published = 't'")
        @transac = BuyersStock.joins("LEFT OUTER JOIN transactions ON  buyers_stocks.user_id = transactions.user_id" ).where(user_id: current_user.id)
      end
    
    #   def new
    #     @stock = api(params[:id])
    #     @buyers_stock = BuyersStock.new
    #   end
    
      def create
        @buyers_stock = BuyersStock.new(buyers_stock_params)
        @transactions = Transaction.new(user_id: params[:user_id],buy_date: params[:buy_date])
          if @buyers_stock.save && @transactions.save
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
          params.permit(:symbol, :company, :current_Price, :change, :previous_close, :user_id)
        #   symbol: params[:symbol],company: params[:company],current_Price: params[:current_Price], change: params[:change], previous_close: params[:previous_close] , user_id: params[:user_id]
        end
end

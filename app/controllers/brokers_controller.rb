class BrokersController < ApplicationController
    def show
        @stock = api(params[:id])
    end
    
    def portfolio
        @stock = Stock.where(user_id: current_user.id)
    end

    def transactions
        @transac = Stock.joins("LEFT OUTER JOIN transactions ON  stocks.user_id = transactions.user_id" ).where(user_id: current_user.id)
      end
end

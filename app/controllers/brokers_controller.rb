class BrokersController < ApplicationController
    def show
        @stock = api(params[:id])
    end

    def edit
        @stock = Stock.find(params[:id])
    end

    def portfolio
        @stock = Stock.where(user_id: current_user.id)
    end

    def transactions
        @transac = Stock.where(on_sale: "true")
      end
end

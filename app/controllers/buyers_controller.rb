class BuyersController < ApplicationController
    before_action :unless_admin

    def index
        @buyers = User.all.where(role: "buyer")
    end
end

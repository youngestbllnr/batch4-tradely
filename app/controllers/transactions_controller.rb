class TransactionsController < ApplicationController
    before_action :unless_admin, only: :index

    def index
        @transactions = Transaction.all
    end
end

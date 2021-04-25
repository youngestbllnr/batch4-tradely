class BrokerController < ApplicationController
    before_action :unless_admin

    def index
        @brokers = User.all.where(role: "broker")
    end

    def pending
        @pending_brokers = User.all.where(role: "pending_broker")
    end
end

class DashboardsController < ApplicationController
    before_action :authenticate_user!
    before_action :unless_admin, only: :admin
    before_action :unless_broker, only: :broker
    before_action :unless_buyer, only: :buyer

    def buyer; end

    def broker; end

    def admin; end
    
end

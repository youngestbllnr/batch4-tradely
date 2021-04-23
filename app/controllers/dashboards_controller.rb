class DashboardsController < ApplicationController
    before_action :authenticate_user!
    before_action :unless_admin, only: :admin
    before_action :unless_broker, only: :broker
    before_action :unless_buyer, only: :buyer

    def buyer; end

    def broker; end

    def admin; end

    protected

    def admin?
        current_user.role == "admin"
    end

    def broker?
        current_user.role == "broker"
    end

    def buyer?
        current_user.role == "buyer"   
        # stocks
            @array = getStockslist

    end

    def unless_admin
        unless admin?
            flash[:danger] = "Unauthorized Access."
            redirect_to root_path
        end
    end

    def unless_broker
        unless broker?
            flash[:danger] = "Unauthorized Access."
            redirect_to root_path
        end
    end

    def unless_buyer
        unless buyer?
            flash[:danger] = "Unauthorized Access."
            redirect_to root_path
        end
    end

    def getStockslist
        [
            @MSFT = api('MSFT'),
            @TSLA = api('TSLA'),
            @A = api('A'),
            @APP = api('APP'),
            @AAON = api('AAON'),
            @AAWW = api('AAWW'),
            @AB = api('AB'),
            @ABB = api('ABB'),
            @ABBV = api('ABBV'),
            @ABC = api('ABC'),
            @ABCM = api('ABCM')
    
        ]
    end
end

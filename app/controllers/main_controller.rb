class MainController < ApplicationController

    # GET /
    def index

        client = IEX::Api::Client.new(
        publishable_token: 'pk_e6d1a6773f504fa1b690c1bb25b22690',
        endpoint: 'https://cloud.iexapis.com/v1'
        )

        @MSFT = client.quote('MSFT')
    end

end

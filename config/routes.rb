Rails.application.routes.draw do
  get 'buyers_stock/:id'   => 'buyers_stock#show' , as: 'show_stock'
  post '/buyers_stock' => 'buyers_stock#create' , as: 'create_stocks'
  default_url_options :host => "localhost", port: 3000 if Rails.env.development? || Rails.env.test?
  default_url_options :host => "avion-tradely.herokuapp.com" if Rails.env.production?

  root 'main#index'

  # Dashboard
  get 'dashboard/buyer'     => 'dashboards#buyer'        , as: 'buyer_dashboard'
  get 'dashboard/broker'    => 'dashboards#broker'       , as: 'broker_dashboard'
  get 'dashboard/admin'     => 'dashboards#admin'        , as: 'admin_dashboard'

  get 'buyer/buyer' => 'buyers#buyer' , as: 'buy_stocks'

  devise_for :users, controllers: 
                      { 
                        sessions: 'users/sessions',
                        registrations: 'users/registrations',
                        confirmations: 'users/confirmations'
                      },
                     path: 'auth',
                     path_names:
                      { 
                        sign_in: 'login',
                        sign_out: 'logout',
                        sign_up: 'signup',
                        registration: 'register',
                        confirmation: 'verification',
                        password: 'secret'
                      }
end

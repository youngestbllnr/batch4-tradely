Rails.application.routes.draw do
  default_url_options :host => "localhost", port: 3000 if Rails.env.development? || Rails.env.test?
  default_url_options :host => "avion-tradely.herokuapp.com" if Rails.env.production?

  root 'main#index'

  # Dashboards
  get 'dashboard/buyer'     => 'dashboards#buyer'        , as: 'buyer_dashboard'
  get 'dashboard/broker'    => 'dashboards#broker'       , as: 'broker_dashboard'
  get 'dashboard/admin'     => 'dashboards#admin'        , as: 'admin_dashboard'

  # Portfolios
  get 'portfolio/buyer'     => 'portfolios#buyer'        , as: 'buyer_portfolio'
  get 'portfolio/broker'    => 'portfolios#broker'       , as: 'broker_portfolio'

  # Transactions
  get 'transactions/buyer'  => 'transactions#buyer'      , as: 'buyer_transactions'
  get 'transactions/broker' => 'transactions#broker'     , as: 'broker_transactions'
  get 'transactions/admin'  => 'transactions#admin'      , as: 'admin_transactions'

  # Brokers
  get 'brokers'             => 'brokers#index'           , as: 'brokers'
  get 'brokers/pending'     => 'brokers#pending'         , as: 'pending_brokers'
  
  post 'brokers/approve'    => 'brokers#approve'         , as: 'approve_broker'

  devise_for :users, controllers: 
                      {
                        registrations: 'users/registrations'
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
  
  resources :buyers
  resources :buyersstocks
  resources :brokersstocks
  resources :stocks
end

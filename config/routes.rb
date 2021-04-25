Rails.application.routes.draw do
  default_url_options :host => "localhost", port: 3000 if Rails.env.development? || Rails.env.test?
  default_url_options :host => "avion-tradely.herokuapp.com" if Rails.env.production?

  root 'main#index'

  # Dashboard
  get 'dashboard/buyer'     => 'dashboards#buyer'        , as: 'buyer_dashboard'
  get 'dashboard/broker'    => 'dashboards#broker'       , as: 'broker_dashboard'
  get 'dashboard/admin'     => 'dashboards#admin'        , as: 'admin_dashboard'

  # Pending Brokers
  get 'pending-brokers'     => 'brokers#pending'         , as: 'pending_brokers'

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
  
  resources :buyers
  resources :brokers
  resources :transactions
end

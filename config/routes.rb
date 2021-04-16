Rails.application.routes.draw do
  root 'main#index'
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
                        sign_up: 'get_started',
                        registration: 'register',
                        confirmation: 'verification',
                        password: 'secret'
                      }
end

Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/hello_world', to: 'hello_world#index'
  get '/reports/info', to: 'reports#info'
end

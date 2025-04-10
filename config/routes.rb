Rails.application.routes.draw do
  get "subscribers/create"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
   
  # 👇👇 THIS is your root route — new line!
  root "products#index"


  #! Always put more specific routes before dynamic ones:

  # get "/products", to: "products#index"
  # # if not using resources :products we get products_new_path, we can change it via the aliases
  # get 'products/new', to: 'products#new', as: 'new_product'

  # post "/products", to: "products#create"
  # get "/products/:id", to: "products#show", as: 'product'

  # get "/products/:id/edit", to: "products#edit", as: 'edit_product'
  # patch "/products/:id", to: "products#update"
  # put "/products/:id", to: "products#update"

  # delete "/products/:id", to: "products#destroy"

# resources :products for all actions

resources :products do
  resources :subscribers, only: [ :create ]
end


resource :unsubscribe, only: [ :show ]


  
end

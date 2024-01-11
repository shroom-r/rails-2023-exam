Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: redirect("/products")

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get 'discounts', to: 'products#index', as: 'discounted_products', scope: 'discounted'

  get 'archives', to: 'products#index', as: 'archived_products', archived: true, scope: "archived"
  get ':category', to: 'products#index', as: 'products_by_category',
    constraints: { category: /#{Product.categories.keys.join('|')}/ }
  
  resources :products do
    patch 'archive', on: :member
  end
end

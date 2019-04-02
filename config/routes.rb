Rails.application.routes.draw do

  devise_for :users
  
  root :to => 'welcome#index'
  
  get 'welcome/index', as: 'home'

  get 'payments/index', as: 'payments'

  get 'payments/show'

  get 'payments/new'

  get 'payments/edit'

  get 'customers/index', as: 'customers'

  get 'customers/show'

  get 'customers/new'

  get 'customers/edit'

  get 'orders/index', as: 'orders'

  get 'orders/show'

  get 'orders/new'

  get 'orders/edit'

  get 'products/index' , as: 'products'

  get 'products/show'

  get 'products/new'

  get 'products/edit'

  get 'employees/index' , as: 'employees'

  get 'employees/show'

  get 'employees/new'

  get 'employees/edit'

  get 'departments/index', as: 'departments'

  get 'departments/show'

  get 'departments/new'

  get 'departments/edit'

  resources :locations
  
  resources :locations do
    resources :departments
    resources :employees
  end
  
  resources :departments do
    resources :products
  end
  
  resources :orders do
    resources :products
  end
  
  resources :products do
    resources :orders
  end
  
  resources :employees do
    resources :customers # sales rep
  end
  
  resources :customers do
    resources :payments
  end
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

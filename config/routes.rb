Rails.application.routes.draw do
  root to: "home#index"
  match "/help", to: "home#help", via: [:get], as: 'help'

  # ----- ADMINISTRATION -----
  resources :tickets do
    patch :close
    patch :open
    get :respond
  end

  resources :comments
  resources :contacts do
    resources :comments do
      collection do
        get 'about'
      end
    end
  end
  match '/contacts/:id/view', to: 'contacts#view', via: [:patch, :get], as: 'view_contact'

  resources :bills do
    resources :comments do
      collection do
        get 'about'
      end
    end
  end

  resources :clients do
    resources :comments do
      collection do
        get 'about'
      end
    end
  end

  # ----- DASHBOARDS -----
  match "/users/dashboard", to: 'home#user_dashboard', via: [:get], as: 'users_dashboard'
  match "/users", to: redirect('/users/dashboard'), via: [:get]
  devise_for :users
  match "/admins/dashboard", to: 'home#admin_dashboard', via: [:get], as: 'admins_dashboard'
  match "/admins", to: redirect('/admins/dashboard'), via: [:get]
  match "/admins/export", to: "home#export", via: [:get], as: 'admins_export'
  devise_for :admins

  # ----- CLIENTS -----
  resources :client_tickets, path: '/client/tickets' do
    patch :close
    patch :open
    get :respond
  end
  resources :client_bills, path: '/client/bills'

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

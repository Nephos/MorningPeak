Rails.application.routes.draw do
  root to: "home#index"
  match "/help", to: "home#help", via: [:get], as: 'help'

  resources :comments

  # ----- ADMINISTRATION -----

  resources :tickets do
    patch :close
    patch :open
    get :respond
  end


  resources :contacts do
    get :autocomplete_client_name, :on => :collection
    resources :comments do
      collection do
        get 'about'
      end
    end
  end
  match '/contacts/:id/view', to: 'contacts#view', via: [:patch, :get], as: 'view_contact'

  resources :bills do
    get :autocomplete_client_name, :on => :collection
    resources :comments do
      collection do
        get 'about'
      end
    end
  end

  resources :clients do
    get :autocomplete_contact_name, :on => :collection
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

end

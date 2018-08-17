Rails.application.routes.draw do
  namespace :admins do
    resources :reports, only: [:index, :show]
  end
  namespace :admins do
    resources :charges, only: [:new, :create, :edit, :update]
  end
  namespace :admins do
    resources :categories, only: [:new, :create, :edit, :update]
  end
  namespace :admins do
    resources :recruitments, only: [:index, :show]
  end
  namespace :admins do
    resources :users, only: [:index, :show, :destroy]
  end

  resources :recruitments, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    collection do
      get :search
      get :search_result
      get :new_subscription
    end
    member do
      get :edit_subscription
    end
    resource :recruitment_charges, only: [:create, :destroy]
    resource :recruitment_categories, only: [:create, :destroy]
  end

  resources :favorite_songs, only: [:create, :update, :destroy]
  resources :favorite_artists, only: [:create, :update, :destroy]
  resources :favorite_albums, only: [:create, :update, :destroy]

  root 'users#top'
  resources :users, only: [:show, :edit, :update] do
    collection do
      get :search
      get :search_result
    end
    member do
      get :mypage
      get :edit_profile
      get :edit_profile_image
      get :edit_email
      get :edit_password
    end
    resource :bad_evaluations, only: [:create, :destroy]
    resource :good_evaluations, only: [:create, :destroy]
    resource :user_charges, only: [:create, :destroy]
    resource :user_categories, only: [:create, :destroy]
    get 'recipient_users/:id/messages' => 'messages#index', as: 'recipient_user_messages'
    post 'recipient_users/:id/messages' => 'messages#create'
    get 'reported_users/:id/reports/new' => 'reports#new', as: 'reported_user_new_report'
    post 'reported_users/:id/reports' => 'reports#create'
  end

  devise_for :admins, controllers: {
  	sessions: 'admins/sessions',
  	passwords: 'admins/passwords',
  	registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :unit_owners, controllers: {
    invitations: 'unit_owners/invitations'
  }

  devise_for :admin_users, controllers: {
    registrations: 'admin_users/registrations',
    sessions: 'admin_users/sessions',
    # omniauth_callbacks: 'admin_users/omniauth_callbacks',
    # invitations: 'admin_users/invitations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  scope module: :admin, path: '/a' do
    get 'dashboard/index'
    resources :apartments do
      resources :floors
    end

    resources :floors do
      resources :units
    end

    namespace :unit_owner do
      resources :units do
        resources :invitations, only: %i[new create]
      end
    end

    namespace :onboarding, path: 'onboarding' do
      resources :account_details, only: %i[new create]
      resources :admin_user_profiles, only: %i[new create]
    end

  end

  namespace :unit_owners do
    resources :invitations, only: [:new, :create]
  end

  scope module: :tenant, path: '/t' do
    get 'dashboard/index'

    namespace :onboarding, path: 'onboarding' do
      resources :owner_informations, only: [:edit, :update]
    end
  end
end

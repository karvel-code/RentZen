Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope module: :admin, path: '/a' do
    get 'dashboard/index'
    resources :apartments do
      resources :floors
    end

    resources :floors do
      resources :units
    end

    namespace :onboarding, path: 'onboarding' do
      resources :account_details, only: %i[new create]
      resources :landlord_details, only: %i[new create]
    end

  end

  scope module: :tenant, path: '/t' do
    get 'dashboard/index'
  end
end

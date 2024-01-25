Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope module: :admin, path: '/a' do
    get 'dashboard/index'
  end

  scope module: :tenant, path: '/t' do
    get 'dashboard/index'
  end

end

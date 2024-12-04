Rails.application.routes.draw do
  get 'admin/dashboard'
  get 'admin/table'
  get 'admin/receipt'
  devise_for :users
  get 'form', to: 'inspects#schedule_form'
  get 'show', to: 'inspects#show'
  post 'inspect_create', to: 'inspects#create'
  patch 'inspects/:id/change_status', to: 'admin#change_status', as: :change_status
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "inspects#schedule"
end

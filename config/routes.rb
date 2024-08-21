Rails.application.routes.draw do
  root 'employees#index'
  resources :employees, only: [:index]
  get 'fetch_employees', to: 'employees#fetch_employees'
end

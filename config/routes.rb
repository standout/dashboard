Rails.application.routes.draw do
  get 'dashboards/*provider', to: 'dashboards#show', as: 'dashboard'
  root to: 'dashboards#index'
end

Rails.application.routes.draw do
  root 'home#index'

  # Exemple: GET /prices?date=2025-11-15
  get 'prices', to: 'prices#index'

  # Exemple: GET /best_gain?date=2025-11-15
  get 'best_gain', to: 'best_daily_potential_gain#index'

  # this line means the status or the heath we can say of the api - end point 
  get "up" => "rails/health#show", as: :rails_health_check
end
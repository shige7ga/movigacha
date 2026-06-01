Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "gachas#index"
  get "/result", to: "gachas#result", as: :result
end

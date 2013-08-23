Statsboard::Application.routes.draw do
  resources :events

  root to: 'metrics#index'
end

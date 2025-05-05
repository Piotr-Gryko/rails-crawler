Rails.application.routes.draw do
  devise_for :users
  root "game#index"
  post 'move', to: 'game#move'
  post 'turn', to: 'game#turn'
end

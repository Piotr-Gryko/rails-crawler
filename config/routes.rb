Rails.application.routes.draw do
  root "game#index"
  post "move", to: "game#move"
  post "turn", to: "game#turn"
end

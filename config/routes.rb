Rails.application.routes.draw do

  get "/404" => "errors#not_found"
  get "/500" => "errors#internal_server_error"

  resources :articles, only: [:index, :show]
  resources :authors,  only: [:index, :show], param: :slug

end

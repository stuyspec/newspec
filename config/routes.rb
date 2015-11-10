Rails.application.routes.draw do

  get "/404" => "errors#not_found"
  get "/500" => "errors#internal_server_error"

  resources :articles, only: [:index, :show]

  get "/:year/:issue/:slug", to: "articles#by_slug", constraints: {year: /\d{4}/, issue: /\d+/}, as: :article_path
  get "/:year/:issue", to: "articles#by_issue", constraints: {year: /\d{4}/, issue: /\d+/}, as: :issue_path
  get "/:year", to: "articles#by_year", constraints: {year: /\d{4}/}, as: :year_path

end

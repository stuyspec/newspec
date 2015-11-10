Rails.application.routes.draw do

  get '/404' => 'errors#not_found'
  get '/500' => 'errors#internal_server_error'

  resources :authors, only: [:index, :show], param: :slug

  get '/:year/:issue_num/:slug', to: 'articles#by_slug', constraints: {year: /\d{4}/, issue_num: /\d+/}, as: :article_path
  get '/:year/:issue_num', to: 'articles#by_issue', constraints: {year: /\d{4}/, issue_num: /\d+/}, as: :issue_path
  get '/:year', to: 'articles#by_year', constraints: {year: /\d{4}/}, as: :year_path

end

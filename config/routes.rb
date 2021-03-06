Rails.application.routes.draw do

  root "public/articles#index"
  get 'spec', to: 'application#spec'

  scope module: 'public' do
    get 'aloha'
    get 'tinymce'

    get 'articles', to: 'articles#index', as: 'public_articles'
    get 'issues',   to: 'issues#index',   as: 'public_issues'
    get 'years',    to: 'years#index',    as: 'public_years'

    constraints({year: /\d{4}/, issue: /\d+/}) do
      get ':year/:issue/:article_slug', to: 'articles#show',  as: 'public_article'
      get ':year/:issue',               to: 'issues#show',    as: 'public_issue'
      get ':year',                      to: 'years#show',     as: 'public_year'
    end

    scope only: [:index, :show] do
      resources :profiles,    path: 'authors',  as: 'authors'
      resources :departments, path: 'sections', as: 'sections'
    end
  end

  get 'sp-admin', to: 'admin#index', as: 'admin_root'
  scope 'sp-admin', module: 'admin' do
    resources :users, :profiles, :roles, :articles, :departments
    match 'roles/new_cap/:id', to: 'roles#new_cap', via: [:put, :patch], as: 'role_new_cap'
  end

  devise_for :users, path: 'sp-admin', sign_out_via: [:delete]

  match '/404', to: 'errors#file_not_found', via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

  # MUST BE LAST ROUTE
  match "*any", via: :all, to: "public/errors#file_not_found"

end

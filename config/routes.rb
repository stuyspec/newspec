Rails.application.routes.draw do

  root "public/articles#index"

  scope module: 'public' do
    get 'tinymce'
    get 'articles', to: 'articles#index', as: 'public_articles'
    get 'issues',   to: 'issues#index',   as: 'public_issues'
    get 'years',    to: 'years#index',    as: 'public_years'

    constraints({year_id: /\d{4}/, issue_id: /\d+/}) do
      get ':year_id/:issue_id/:article_slug', to: 'articles#show',  as: 'public_article'
      get ':year_id/:issue_id',               to: 'issues#show',    as: 'public_issue'
      get ':year_id',                         to: 'years#show',     as: 'public_year'
    end


    scope only: [:index, :show] do
      resources :profiles,    path: 'authors',  as: 'authors'
      resources :departments, path: 'sections', as: 'sections'
    end
  end

  get 'sp-admin', to: 'admin#index'
  scope 'sp-admin', module: 'admin' do
    resources :users, :profiles, :roles, :articles, :departments
  end

  devise_for :users, path: 'sp-admin', sign_out_via: [:delete]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

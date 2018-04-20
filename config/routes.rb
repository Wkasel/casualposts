require 'constraints'
include Constraints
Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  # resources :categories, only: [:index, :show]

  # [http|https]://[Region].casualposts.[com|test|dev]/s/[Subregion]/[Category]/search/[search-term-hyphenated]/posts/[post-slug-hyphinated](/{id}.html)
  #                        (filter)              [search][term]
  # sfbay.casualposts.com/s/sfc/casual-encounters/search/w4m/posts
  # sfbay.casualposts.com/s/casual-encounters/posts/looking-for-love/00231.html
  # ', :constraints => Constraints::ValidateSubRegionConstraint.new
  # , :constraints => Constraints::ValidateCategoryConstraint.new
  # , :constraints => Constraints::ParseSearchConstraint.new
  scope '*subregion' do
    scope '*category' do
      scope '*search' do
        resources :posts, only: [:index]
        root 'posts#index'
      end
    end
    root 'welcome#index'
  end
  scope '*category' do
    scope '*search' do
      resources :posts, only: [:index]
    end
    resources :posts, only: [:show]
    root 'posts#index'
  end
    # scope '/s/*filters', :constraints => Constraints::ParseFilterURLConstraint.new do
    #   resources :posts do
    #   end
    #   root 'welcome#index'
    # end
  # end

  # resources :posts
  resources :users, except: [:index]

  get '/login', to: 'session#login', as:'login'
  post '/login', to: 'session#create'
  get '/logout', to: 'session#logout', as:'logout'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

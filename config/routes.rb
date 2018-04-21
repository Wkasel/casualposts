require 'constraints'
include Constraints
Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :users, except: [:index]

  get '/login', to: 'session#login', as:'login'
  post '/login', to: 'session#create'
  get '/logout', to: 'session#logout', as:'logout'
  # resources :categories, only: [:index, :show]

  # [http|https]://[Region].casualposts.[com|test|dev]/s/[Subregion]/[Category]/search/[search-term-hyphenated]/posts/[post-slug-hyphinated](/{id}.html)
  #                        (filter)              [search][term]
  # sfbay.casualposts.com/s/sfc/casual-encounters/search/w4m/posts
  # sfbay.casualposts.com/s/casual-encounters/posts/looking-for-love/00231.html
  # ', :constraints => Constraints::ValidateSubRegionConstraint.new
  scope 'manage' do
    scope '*category', :constraints => Constraints::ValidateCategoryConstraint.new do
      scope '*search', :constraints => Constraints::ParseSearchConstraint.new do
        resources :posts, only: [:index]
      end
      resources :posts, only: [:show, :index]
      root 'welcome#subcategory'
    end
  end

  scope 's/*subregion', :constraints => Constraints::ValidateSubRegionConstraint.new do
    scope '*category', :constraints => Constraints::ValidateCategoryConstraint.new do
      scope '*search', :constraints => Constraints::ParseSearchConstraint.new do
        resources :posts, only: [:index]
        root 'posts#index'
      end
      root 'welcome#subcategory'
    end
    root 'welcome#index'
  end
  scope 'c/*category', :constraints => Constraints::ValidateCategoryConstraint.new do
    scope '*search', :constraints => Constraints::ParseSearchConstraint.new do
      resources :posts, only: [:index]
      root 'posts#index'
    end
    root 'welcome#subcategory'
  end

  scope 'a/*search', :constraints => Constraints::ParseSearchConstraint.new do
    resources :posts, only: [:index]
    root 'posts#index'
  end

    # scope '/s/*filters', :constraints => Constraints::ParseFilterURLConstraint.new do
    #   resources :posts do
    #   end
    #   root 'welcome#index'
    # end
  # end

  # resources :posts


  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

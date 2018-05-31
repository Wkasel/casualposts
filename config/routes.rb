require 'constraints'
include Constraints
Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  constraints(:subdomain => 'api') do
    mount_griddler
    root 'welcome#subcategory'
  end

  resources :users, except: [:index]


  get '/login', to: 'session#login', as:'login'
  post '/login', to: 'session#create'
  get '/logout', to: 'session#logout', as:'logout'
  # resources :categories, only: [:index, :show]

  # [http|https]://[Region].casualposts.[com|test|dev]/s/[Subregion]/c/[Category]/search/[search-term-hyphenated  ]/posts/[post-slug-hyphinated](/{id}.html)
  #                        (filter)              [search][term]
  # sfbay.casualposts.com/s/sfc/casual-encounters/search/w4m/posts
  # sfbay.casualposts.com/c/casual-encounters/posts/looking-for-love/00231.html
  # ', :constraints => Constraints::ValidateSubRegionConstraint.new
  # scope 'manage' do
  #   resources :posts
  # end
  scope '(s/:subregion)', :constraints => Constraints::ValidateSubRegionConstraint.new do
    scope '(c/:category)', :constraints => Constraints::ValidateCategoryConstraint.new do
      scope '(search/:search)', :constraints => Constraints::ParseSearchConstraint.new do
        resources :posts
        get '', to: redirect('/posts')
      end
      root 'welcome#subcategory'
    end
    root 'welcome#index'
  end
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

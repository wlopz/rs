Rails.application.routes.draw do

  devise_for :authors
  root to: "menu#home"

  # post '/tinymce_assets' => 'tinymce_assets#create'

  namespace :authors do
    resources :blogs do
      get 'blogs/index'
      put 'publish' => 'blogs#publish', on: :member
      put 'unpublish' => 'blogs#unpublish', on: :member
    end
  end

  get 'menu/home'

  get 'team' => 'menu#team', as: :team

  get 'menu/patient'

  get 'menu/about'

  get 'menu/sports'

  get 'menu/wellness'

  get 'menu/stories'

  get 'blogs' => 'blogs#index', as: :blogs

  get 'blogs/:id' => 'blogs#show', as: :blog

  get 'menu/contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

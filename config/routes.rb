Rails.application.routes.draw do

  resources :blogs do
    get 'blogs/index'
  end

  get 'menu/home'

  get 'team' => 'menu#team', as: :team

  get 'menu/patient'

  get 'menu/about'

  get 'menu/sports'

  get 'menu/wellness'

  get 'menu/stories'

  # get 'blog' => 'blogs#index', as: :blog

  get 'menu/contact'

  root to: "menu#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

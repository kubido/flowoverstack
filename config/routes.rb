Rails.application.routes.draw do

  root   'questions#index'

  get    'signup', to: 'users#new'
  post   'signup', to: 'users#create'
  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get    'search', to: 'questions#search'

  resources :questions do

    resources :answers, except: [:index, :show, :new] do
      resources :comments, module: :answers, except: [:index, :show]
      resources :votes,    module: :answers, only: [:create, :destroy]
    end

    resources :comments, module: :questions, except: [:index, :show]
    resources :votes,    module: :questions, only: [:create, :destroy]
  end
end

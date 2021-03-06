Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sigin_out: :logout }

  resources :tests, only: :index do 
    
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
      get :compleate_timer
    end
  end

  resources :badges, only: :index

  namespace :admin do
    resources :tests do 
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: %i[show index]
    resources :badges
  end

  resources :feedback, only: [:index, :create]
end

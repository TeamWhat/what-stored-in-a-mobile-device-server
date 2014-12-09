Rails.application.routes.draw do

  resources :videos,
            :texts,
            :audios,
            :applications,
            :images,
            :collections,
            :subjects,
            only: [:index, :show, :destroy]

  resources :emails, only: [:index, :destroy]
  get 'shared/:token', to: 'subjects#shared'
  resources :visualizations, only: [:index]
  devise_for :users
  post 'submit', to: 'receive_data#receive'

  root 'welcome#welcome'
end

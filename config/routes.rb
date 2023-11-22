Rails.application.routes.draw do
  devise_for :users
  get 'prefectures/index'
  root to: "prefectures#index"
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    get 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  resources :users, only: [:edit, :update]
end

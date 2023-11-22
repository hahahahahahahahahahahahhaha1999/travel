Rails.application.routes.draw do
  get 'prefectures/index'
  root to: "prefectures#index"
end

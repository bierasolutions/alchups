Rails.application.routes.draw do
  devise_for :admins
  root 'tanks#index'
  get 'order_by_title' => 'tanks#order_by_title'
  get 'order_by_id' =>    'tanks#order_by_id'
  resources :tanks do
    resources :photos, only: [:create, :destroy, :new]
  end
  resources :qr, only: [:show]
end

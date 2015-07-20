Rails.application.routes.draw do
  devise_for :admins

  devise_scope :admin do
    authenticated :admin do
      root 'tanks#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  get 'order_by_title' => 'tanks#order_by_title'
  get 'order_by_id' =>    'tanks#order_by_id'
  resources :tanks do
    resources :photos, only: [:create, :destroy, :new]
  end
  resources :qr, only: [:show]
end

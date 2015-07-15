Rails.application.routes.draw do
  root 'tanks#index'
  get 'order_by_title' => 'tanks#order_by_title'
  get 'order_by_id' =>    'tanks#order_by_id'
  resources :tanks
end

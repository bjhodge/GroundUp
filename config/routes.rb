Rails.application.routes.draw do
  resources :services
  devise_for :users
  resources :testimonials
  
  root 'homepage#index'

  get 'testimonials' => 'testimonials#index'

  get 'contact_us' => 'homepage#contact_us'

  get 'services' => 'services#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

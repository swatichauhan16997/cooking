  Rails.application.routes.draw do
  devise_for :admins, :controllers => {registrations: 'admins/registrations', sessions: 'admins/sessions', passwords: 'admins/passwords' }
  root to: 'admins/homes#index'
  namespace 'admins' do
    get 'homes/index'
    resources :categories
    resources :sub_categories
    resources :recipes
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do

  devise_for :users
  resources :conversations do
  	resources :messages
  end 

	resources :notices do
		resources :comments
	end
	root 'notices#index'
end

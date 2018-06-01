Rails.application.routes.draw do
	get 'signup' => 'customers#new'
	resources :customers

	get 'login' => 'sessions#new'
	post 'login' => 'sessions#create'

	delete 'logout' => 'sessions#destroy'
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
	root 'welcome#index'
	get 'welcome/about', to: 'welcome#about'

	resources  :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

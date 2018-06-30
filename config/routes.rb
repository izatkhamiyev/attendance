Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      	get "/token", to: "requests#create"
    	post "/add", to: "requests#add"
    	get "/students", to: "requests#show"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

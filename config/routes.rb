Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "user#log"
  post "/user/login", to: "user#login"
  match "/user/logout", to: "user#logout", via: [:get, :delete]

  get "/user/register", to: "user#reg"
  post "/user/reg", to: "user#register"

  get "/user/status/:id", to: "user#status"

  get "/user/dashboard/:id", to: "user#main"

  get "/admin/add", to: "admin#new"
  post "/admin/new", to: "admin#add"

  get "/admin/pending", to: "admin#pending"
  get "/admin/approved", to: "admin#approved"
  get "/admin/history", to: "admin#history"
  
  get "/admin/approve/:id", to: "admin#approve"
  get "/admin/decline/:id", to: "admin#decline"
  get "/admin/remove/:id", to: "admin#remove"
  # get "/admin/eremove/:id", to: "admin#eremove"

  get "/admin/log", to: "admin#log", as: "adlog"
  post "/admin/login", to: "admin#login"
  match "/logout", to: "admin#logout", via: [:get, :delete], as: "logout"

  get "/admin/view", to: "admin#view", as: "admindash"


  get "/user/books/:id", to: "user#libro"

  get "/user/rent/:libro/:user", to: "user#rent"
  post "/user/magrent", to: "user#hulam"
end

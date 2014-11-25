# == Route Map
#
#                Prefix Verb   URI Pattern                                       Controller#Action
#                  root GET    /                                                 pages#index
#                 login GET    /login(.:format)                                  session#new
#                       POST   /login(.:format)                                  session#create
#                logout GET    /logout(.:format)                                 session#destroy
#                signup GET    /signup(.:format)                                 users#new
#         user_mappings GET    /users/:user_id/mappings(.:format)                mappings#index
#                       POST   /users/:user_id/mappings(.:format)                mappings#create
#     edit_user_mapping GET    /users/:user_id/mappings/:id/edit(.:format)       mappings#edit
#          user_mapping GET    /users/:user_id/mappings/:id(.:format)            mappings#show
#                       PATCH  /users/:user_id/mappings/:id(.:format)            mappings#update
#                       PUT    /users/:user_id/mappings/:id(.:format)            mappings#update
#                       DELETE /users/:user_id/mappings/:id(.:format)            mappings#destroy
#                 users POST   /users(.:format)                                  users#create
#              new_user GET    /users/new(.:format)                              users#new
#             edit_user GET    /users/:id/edit(.:format)                         users#edit
#                  user GET    /users/:id(.:format)                              users#show
#                       PATCH  /users/:id(.:format)                              users#update
#                       PUT    /users/:id(.:format)                              users#update
#                       DELETE /users/:id(.:format)                              users#destroy
#      mapping_comments GET    /mappings/:mapping_id/comments(.:format)          comments#index
#                       POST   /mappings/:mapping_id/comments(.:format)          comments#create
#   new_mapping_comment GET    /mappings/:mapping_id/comments/new(.:format)      comments#new
#  edit_mapping_comment GET    /mappings/:mapping_id/comments/:id/edit(.:format) comments#edit
#       mapping_comment GET    /mappings/:mapping_id/comments/:id(.:format)      comments#show
#                       PATCH  /mappings/:mapping_id/comments/:id(.:format)      comments#update
#                       PUT    /mappings/:mapping_id/comments/:id(.:format)      comments#update
#                       DELETE /mappings/:mapping_id/comments/:id(.:format)      comments#destroy
#              mappings GET    /mappings(.:format)                               mappings#index
#           new_mapping GET    /mappings/new(.:format)                           mappings#new
#          edit_mapping GET    /mappings/:id/edit(.:format)                      mappings#edit
#               mapping GET    /mappings/:id(.:format)                           mappings#show
#        mapping_upvote GET    /mappings/:id/upvote(.:format)                    mappings#upvote
#      mapping_downvote GET    /mappings/:id/downvote(.:format)                  mappings#downvote
#      mapping_download GET    /mappings/:id/download(.:format)                  mappings#download
#     admin_controllers GET    /admin/controllers(.:format)                      admin/controllers#index
#                       POST   /admin/controllers(.:format)                      admin/controllers#create
#  new_admin_controller GET    /admin/controllers/new(.:format)                  admin/controllers#new
# edit_admin_controller GET    /admin/controllers/:id/edit(.:format)             admin/controllers#edit
#      admin_controller GET    /admin/controllers/:id(.:format)                  admin/controllers#show
#                       PATCH  /admin/controllers/:id(.:format)                  admin/controllers#update
#                       PUT    /admin/controllers/:id(.:format)                  admin/controllers#update
#                       DELETE /admin/controllers/:id(.:format)                  admin/controllers#destroy
#       admin_softwares GET    /admin/softwares(.:format)                        admin/softwares#index
#                       POST   /admin/softwares(.:format)                        admin/softwares#create
#    new_admin_software GET    /admin/softwares/new(.:format)                    admin/softwares#new
#   edit_admin_software GET    /admin/softwares/:id/edit(.:format)               admin/softwares#edit
#        admin_software GET    /admin/softwares/:id(.:format)                    admin/softwares#show
#                       PATCH  /admin/softwares/:id(.:format)                    admin/softwares#update
#                       PUT    /admin/softwares/:id(.:format)                    admin/softwares#update
#                       DELETE /admin/softwares/:id(.:format)                    admin/softwares#destroy
#

Rails.application.routes.draw do
  root to: 'pages#index'

  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  get '/logout', to: 'session#destroy'

  get '/signup', to: 'users#new'

  resources :users, except: [:index] do 
  	resources :mappings, except: [:new]
  end 

  resources :mappings, only: [:show, :index, :new, :edit, :destroy] do 
  	resources :comments
  end 

  get '/mappings/:id/upvote', to: 'mappings#upvote', as: 'mapping_upvote'
  get '/mappings/:id/downvote', to: 'mappings#downvote', as: 'mapping_downvote'
  get '/mappings/:id/download', to: 'mappings#download', as: 'mapping_download'

  namespace :admin do 
  	resources :controllers, :softwares
  end 

  # resources :controllers, only: :show
  # resources :softwares, only: :show
end

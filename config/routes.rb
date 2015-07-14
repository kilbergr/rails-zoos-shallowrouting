Rails.application.routes.draw do
 
 root 'zoos#index'
 resources :zoos do
  resources :animals, shallow: true
 end

#           Prefix Verb   URI Pattern                         Controller#Action
#    zoo_animals GET    /zoos/:zoo_id/animals(.:format)     animals#index
#                POST   /zoos/:zoo_id/animals(.:format)     animals#create
# new_zoo_animal GET    /zoos/:zoo_id/animals/new(.:format) animals#new
#    edit_animal GET    /animals/:id/edit(.:format)         animals#edit
#         animal GET    /animals/:id(.:format)              animals#show
#                PATCH  /animals/:id(.:format)              animals#update
#                PUT    /animals/:id(.:format)              animals#update
#                DELETE /animals/:id(.:format)              animals#destroy
#           zoos GET    /zoos(.:format)                     zoos#index
#                POST   /zoos(.:format)                     zoos#create
#        new_zoo GET    /zoos/new(.:format)                 zoos#new
#       edit_zoo GET    /zoos/:id/edit(.:format)            zoos#edit
#            zoo GET    /zoos/:id(.:format)                 zoos#show
#                PATCH  /zoos/:id(.:format)                 zoos#update
#                PUT    /zoos/:id(.:format)                 zoos#update
#                DELETE /zoos/:id(.:format)                 zoos#destroy
end

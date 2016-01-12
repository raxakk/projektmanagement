Rails.application.routes.draw do
  resources :rounds
  resources :forms
  resources :workers
  resources :rbs
  resources :wbs
  resources :pbs
  resources :welcome
  resources :roadmap

  delete 'rounds' => 'rounds#destroy'

  get 'pbs/:id/new_teilprodukt' => 'pbs#new_teilprodukt', as: :new_teilprodukt
  get 'pbs/:id/new_modul' => 'pbs#new_modul', as: :new_modul
  get 'pbs/:id/new_teilmodul' => 'pbs#new_teilmodul', as: :new_teilmodul
  get 'pbs/:id/new_komponente' => 'pbs#new_komponente', as: :new_komponente

  get 'wbs/:id/new_aufgabe' => 'wbs#new_aufgabe', as: :new_aufgabe
  get 'wbs/:id/new_teilaufgabe' => 'wbs#new_teilaufgabe', as: :new_teilaufgabe
  get 'wbs/:id/new_arbeitspaket' => 'wbs#new_arbeitspaket', as: :new_arbeitspaket

  get 'rbs/:id/new_art' => 'rbs#new_art', as: :new_art
  get 'rbs/:id/new_rolle' => 'rbs#new_rolle', as: :new_rolle

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

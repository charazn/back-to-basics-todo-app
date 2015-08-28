Rails.application.routes.draw do

  root 'lists#index'

  resources :lists, except: :destroy do
    put :archive, on: :member, path: :delete
  end

end

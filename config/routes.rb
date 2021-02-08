Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  # これ動いてた(addressをform_withで渡してた => /addresses)
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  # 動かない(form_withで生成されるのが、引数のモデル名の複数けいだから)
  # こっちはaddress_adminモデルを渡してた(@addressに代入してたのが build_address_admin)
  # つまり、form_withで推測されるパスが /address_admins
  # devise_scope :admin do
  #   get 'addresses', to: 'admins/registrations#new_address'
  #   post 'addresses', to: 'admins/registrations#create_address'
  # end

  # 正解
  # devise_scope :admin do
  #   get 'address_admins', to: 'admins/registrations#new_address'
  #   post 'address_admins', to: 'admins/registrations#create_address'
  # end

  resources :address_admins
  resources :address_admins

  get 'items/index'
  root to: "items#index"
end

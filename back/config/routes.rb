Rails.application.routes.draw do
  apipie
  scope :api, defaults: {format: :json} do

    post 'auth/login', to: 'authentication#authenticate'

    # Usuario
    post 'signup',     to: 'usuarios#create'
    
    resources :cultivos
    resources :usuarios
    resources :fazenda_has_planos
    resources :fazendas
    resources :pessoa_fisicas
    resources :pessoa_juridicas
    resources :pessoas
    resources :planos
    resources :tipo_cultivos
    resources :plantios
    resources :tipo_movimentacaos
    resources :status_plantios
    resources :areas
    resources :tipo_solos
    resources :funcionarios
    resources :cargos
    resources :local_fisicos
    resources :acesso_usuario_fazendas
  end
end

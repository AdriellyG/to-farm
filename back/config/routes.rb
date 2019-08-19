Rails.application.routes.draw do
  resources :areas
  resources :tipo_solos
  resources :funcionarios
  resources :cargos
  resources :local_fisicos
  resources :acesso_usuario_fazendas
  resources :cultivos
  resources :usuarios
  resources :fazenda_has_planos
  resources :fazendas
  resources :pessoa_fisicas
  resources :pessoa_juridicas
  resources :pessoas
  resources :pes_pessoas
  resources :planos
  resources :tipo_cultivos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

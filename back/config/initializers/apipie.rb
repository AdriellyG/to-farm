Apipie.configure do |config|
  config.app_name                = "TO FARM"
  config.api_base_url            = "/api"
  config.doc_base_url            = "/apipie"
  config.app_info                = "TO FARM - Documentação da API"

  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
  config.translate = false
end
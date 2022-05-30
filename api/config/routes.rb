Rails.application.routes.draw do
  get '/api/payloads', to: 'payloads#get'
  get '/api/list/payloads', to: 'payloads#list_all'

  # Shorthand paths for better obfuscation
  get '/a', to: 'payloads#get_b64'
  get '/a/l/p', to: 'payloads#list_all'
end

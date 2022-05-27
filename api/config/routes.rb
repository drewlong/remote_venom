Rails.application.routes.draw do
  get '/api', to: 'payloads#get'
  get '/api/b', to: 'payloads#get_b64'

end

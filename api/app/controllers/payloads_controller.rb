require 'uri'
require 'json'

class PayloadsController < ApplicationController
  def get
    puts "here", params
    res = Payload.generate(params)
    if res
      send_data File.open(res.first, 'rb').read, :filename => res.last
      File.delete(res.first)
    else
      render status: 666
    end
  end
  def get_b64
    dec = Base64.decode64(params[:q])
    params = Hash[URI.decode_www_form(dec)]
    res = Payload.generate(params)
    if res
      send_data File.open(res.first, 'rb').read, :filename => res.last
      File.delete(res.first)
    else
      render status: 666
    end
  end
end

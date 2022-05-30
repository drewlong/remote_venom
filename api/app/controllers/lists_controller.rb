class ListsController < ApplicationController
  def payloads
    payloads = Payload.all.pluck(:path, :description)
    render json: payloads
  end
  def formats
  end
end


class API < Grape::API

  format :json

  helpers do
  end

  mount DontBuy::V1::Base
end
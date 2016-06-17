
class API < Grape::API

  format :json
  require_relative '../dont_buy/validations/length'
  helpers do
  end

  mount DontBuy::V1::Base
end
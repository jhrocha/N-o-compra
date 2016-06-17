module DontBuy
  module V1
    class Base < Grape::API
      prefix 'api'
      version 'v1', using: :path
      helpers do
      end

      mount Causes
      mount Auth
      route :any, '*path' do
        error!('This is not the endpoint you\'re looking for!', 404)
      end
    end
  end
end

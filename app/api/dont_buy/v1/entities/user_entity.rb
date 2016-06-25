module DontBuy::V1::Entity
  class UserEntity < Grape::Entity
        expose :cpf
        unexpose :created_at
        unexpose :updated_at
        expose :token, using
      end
end

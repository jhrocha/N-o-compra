module DontBuy::V1::Entities
  class UserEntity < Grape::Entity
        expose :cpf
        unexpose :created_at
        unexpose :updated_at
        expose :token
        expose :role
      end
end

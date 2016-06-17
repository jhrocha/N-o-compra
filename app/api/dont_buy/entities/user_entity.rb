module DontBuy
  module V1
    module Entity
      class UserEntity < Grape::Entity
        expose :cpf
        unexpose :created_at
        unexpose :updated_at
        unexpose :id
      end
    end
  end

end

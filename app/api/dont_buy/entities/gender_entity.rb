module DontBuy
  module V1
    class GenderEntity < Grape::Entity
      unexpose :id
      unexpose :created_at
      unexpose :updated_at
      unexpose :customer_id
      expose :description
    end
  end
end
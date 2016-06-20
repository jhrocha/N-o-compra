module DontBuy::V1::Entity
  class CausesEntity < Grape::Entity
    expose :description
    # expose :sales_man_dont_buy, as: :sales_man_id
    unexpose :id
    expose :customer, using: DontBuy::V1::Entity::CustomerEntity
    expose :created_at
    unexpose :updated_at
  end
end

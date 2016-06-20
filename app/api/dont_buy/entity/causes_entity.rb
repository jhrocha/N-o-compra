module DontBuy::V1::Entity
  class CausesEntity < Grape::Entity
    expose :id
    expose :description
    expose :created_at
    expose :updated_at
    expose :customer, using: DontBuy::V1::Entity::CustomerEntity

    # expose :sales_man_dont_buy, as: :sales_man_id
  end
end

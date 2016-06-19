module DontBuy
  module V1
    class CausesEntity < Grape::Entity
      expose :description
      expose :sales_man_dont_buy, as: :sales_man_id
      unepose :id
      expose :customer, using: DontBuy::V1::Entities::CustomerEntity
      expose :created_at
      unexpose :updated_at
    end
  end
end

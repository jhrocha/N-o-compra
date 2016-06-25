module DontBuy::V1::Entities
  class DontBuyCauseEntity< Grape::Entity
    expose :cause, using: DontBuy::V1::Entities::CausesEntity
    expose :customer, using: DontBuy::V1::Entities::CustomerEntity
  end
end

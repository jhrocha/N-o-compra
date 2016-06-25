module DontBuy::V1::Entities
  class CausesStatisticsEntity < Grape::Entity
    expose :group
    expose :causes, using: DontBuy::V1::Entities::DontBuyCauseEntity
  end
end

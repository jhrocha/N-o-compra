module DontBuy::V1::Entities
  class CausesStatisticsEntity < Grape::Entity
    expose :group, as: :group_title
    expose :causes, using: DontBuy::V1::Entities::DontBuyCauseEntity
  end
end

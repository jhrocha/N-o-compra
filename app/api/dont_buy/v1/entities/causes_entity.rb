module DontBuy::V1::Entities
  class CausesEntity < Grape::Entity
    expose :id
    expose :description
    expose :question
    expose :answer
    expose :created_at
    expose :updated_at
  end
end

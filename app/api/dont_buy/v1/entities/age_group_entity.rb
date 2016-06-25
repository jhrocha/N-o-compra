module DontBuy::V1::Entities
  class AgeGroupEntity < Grape::Entity
    expose :initial_age
    expose :final_age
  end
end
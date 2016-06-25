module DontBuy::V1::Entities
  class CustomerEntity < Grape::Entity
    unexpose :id
    unexpose :cause_id
    expose :gender do |g|
      g[:gender].description
    end
    expose :initial_age do |a, options|
      a[:age_group].initial_age
    end
    expose :final_age do |a, options|
      a[:age_group].final_age
    end
    unexpose :updated_at
    expose :created_at
    end
end

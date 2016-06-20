module DontBuy::V1::Entity
  class CustomerEntity < Grape::Entity
    unexpose :id
    unexpose :cause_id
    # expose :age_group_id, using: DontBuy::V1::Entity::AgeGroupEntity, as: :age_group
    expose :gender, using: DontBuy::V1::Entity::GenderEntity
    unexpose :updated_at
    expose :created_at
    end
end

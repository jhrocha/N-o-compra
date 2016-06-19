module DontBuy
  module V1
    class CustomerEntity < Grape::Entity
      unexpose :id
      unexpose :cause_id
      expose :age_group_id, using: DontBuy::V1::Entities::AgeGroupEntity, as: :age_group
      expose :gender, using: DontBuy::V1::Entities::GenderEntity
      unexpose :updated_at
      expose :created_at
    end
  end
end

module DontBuy
  module V1
    class Causes < Grape::API
      before do
        authenticated_user?
      end

      helpers do
      end

      resource :cause do

        desc 'Create a dont buy cause'
        params do
          requires :description, type: String
          requires :customer, type: Hash do
            requires :gender, type: String, values: ['m','f']
            requires :initial_age, type: Integer
            requires :final_age, type: Integer
          end
        end
        post 'create' do
          error! "The age is invalid", 500 if params[:customer][:initial_age].to_i>params[:customer][:final_age].to_i

          customer= params[:customer]

          sales_man= SalesManDontBuy.create(user_id:current_user.id)
          age_group= AgeGroup.create(initial_age: customer[:initial_age], final_age: customer[:final_age])
          cause= Cause.create(description: params[:description], sales_man_dont_buy_id: sales_man.id)
          customer= Customer.create(cause_id: cause.id, age_group_id: age_group.id)
          gender= Gender.create(description: params[:customer][:gender], customer_id: customer.id)

          status 200
          {
              cause: cause,
              customer:{
                  gender: customer.gender.description,
                  initial_age: customer.age_group.initial_age,
                  final_age: customer.age_group.final_age,
              }
          }
        end

      end
    end
  end
end

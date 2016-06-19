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
          customer= params[:customer]
          params.delete :customer

          sales_man= SalesManDontBuy.create(user_id:current_user.id)
          age_group= AgeGroup.create(initial_age: customer[:initial_age], final_age: customer[:final_age])
          cause= Cause.create(description: params[:description], sales_man_dont_buy_id: sales_man.id)
          customer= Customer.create(cause_id: cause.id, age_group_id: age_group.id)
          gender= Gender.create(description: customer[:gender], customer_id: customer.id)

          cause
        end

      end
    end
  end
end

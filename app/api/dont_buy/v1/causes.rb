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
          optional :description, type: String
          requires :question, type: String
          requires :answer, type: String
          requires :customer, type: Hash do
            requires :gender, type: String, values: ['m','f']
            requires :initial_age, type: Integer
            requires :final_age, type: Integer
          end
        end
        post 'create' do
          error! "The age is invalid", 500 if params[:customer][:initial_age].to_i>params[:customer][:final_age].to_i

          sales_man= SalesManDontBuy.create(user_id:current_user.id)
          cause= Cause.create(description: params[:description], answer: params[:answer], question: params[:question],
                              sales_man_dont_buy_id: sales_man.id)
          customer= Customer.create(cause_id: cause.id)
          age_group= AgeGroup.create(initial_age: params[:customer][:initial_age], final_age: params[:customer][:final_age], customer_id: customer.id)
          gender= Gender.create(description: params[:customer][:gender], customer_id: customer.id)

          #TODO Use Grape entity
          status 200
          {
              cause: cause,
              customer:{
                  gender: customer.gender.description,
                  initial_age: cause.customer.age_group.initial_age,
                  final_age: cause.customer.age_group.final_age,
              }
          }
        end

        desc 'List causes by dates'
        params do
          requires :start_date, type: Date
          requires :end_date, type: Date
        end
        post 'list_by_dates' do

          error! "The start date is greater than the end", 500 if params[:start_date] > params[:end_date]

          sales_id= SalesManDontBuy.where(user_id: current_user.id).pluck(:id)
          causes_list= Array.new

          #TODO: Use Grape-entity
          sales_id.each do |identifier|
            c= Cause.find_by sales_man_dont_buy_id: identifier
            cause= {
                description: c.description,
                question: c.question,
                answer: c.answer,
                created_at: c.created_at,
                customer:{
                    gender: c.customer.gender.description,
                    age_group:{
                        start_age: c.customer.age_group.initial_age,
                        end_age: c.customer.age_group.final_age
                    }
                }
            }

            causes_list << cause
          end

          causes_list
        end

      end
    end
  end
end

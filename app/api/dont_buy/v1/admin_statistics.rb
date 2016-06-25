class DontBuy::V1::AdminStatistics < Grape::API
  before do
    authenticated_user?
    is_admin?
  end
  helpers do
    def mount_hash_cause(cause: cause)
      {
          cause: cause,
          customer:{
              created_at: cause.customer.created_at,
              gender: cause.customer.gender,
              age_group: cause.customer.age_group
          }
      }

    end
  end

  resource :statistics do

    desc 'List all causes grouped by date'
    params do
      requires :start_date, type: Date, allow_blank: false
      requires :end_date, type: Date, allow_blank: false
      requires :group_by, type: String, allow_blank: false, values: ["answer", "description", "question"]
    end
    post 'all_causes' do
      causes= Cause.where(created_at: params[:start_date]..params[:end_date])
      groups= causes.group_by(&params[:group_by].to_sym)
      cause_list= Array.new
      groups.each do |key, obj|
        list= Array.new
        obj.each do |cause|
          cause_hash= mount_hash_cause(cause: cause)
          p cause_hash
          list << cause_hash
        end
        cause_list << {group: key.to_s, causes: list}
      end
      status 200
      present cause_list, with: DontBuy::V1::Entities::CausesStatisticsEntity
    end
  end

end


class DontBuy::V1::AdminStatistics < Grape::API
  before do
    authenticated_user?
    is_admin?
  end

  resource :statistics do

    desc 'List all causes grouped by date'
    params do
      requires :start_date, type: Date, allow_blank: false
      requires :end_date, type: Date, allow_blank: false
    end
    post 'all_causes' do
      causes= Cause.where(created_at: params[:start_date]..params[:end_date])
      causes= causes.group_by(&:answer)

      status 200
      causes
    end
  end

end


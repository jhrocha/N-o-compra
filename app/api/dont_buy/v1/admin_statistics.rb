class DontBuy::V1::AdminStatistics < Grape::API
  before do
    authenticated_user?
    is_admin?
  end

  resource :statistics do

  end

end


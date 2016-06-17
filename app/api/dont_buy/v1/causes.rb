
class DontBuy::V1::Causes < Grape::API
  before do
  end

  helpers do
  end

  resource :causes do
    desc 'List hello World'
    params do

    end
    get 'hello_world' do
      status 200
      {response: "Its okay"}
    end
  end
end
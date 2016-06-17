
class DontBuy::V1::Auth < Grape::API
  helpers do
    def generate_token_for_user usr
      token= UserApiToken.create token: SecureRandom.base64, user_id: usr.id
    end
  end

  resource :auth do

    desc 'Register a user'
    params do
    requires :cpf, type: String, allow_blank: false, desc: 'Identity of user'
    requires :email, type: String, allow_blank: false, desc: 'Identity of user'
    requires :password, type: String, length: 9, allow_blank: false, desc: 'Password of account'
  end
    post 'sign_up' do
      error! "User with cpf #{params[:cpf]} has already registered", 500 if User.find_by cpf: params[:cpf]
      error! "User with email #{params[:email]} has already registered", 500 if User.find_by cpf: params[:email]

      user= User.create params
      secret_key= generate_token_for_user user
      status 200
      {user: user, token: secret_key.token}
    end
  end

end
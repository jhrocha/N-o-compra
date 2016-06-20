
class DontBuy::V1::Auth < Grape::API
  helpers do
    def generate_token_for_user usr
      token= UserApiToken.create token: SecureRandom.base64, user_id: usr.id
    end
  end

  resource :auth do
    # TODO: Realizar verificação do tamanho do password
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

    desc 'Login for a user'
    params do
      requires :email, type: String, allow_blank: false, desc: 'Users email'
      requires :password, type: String, allow_blank: false, desc: 'Users password'
    end
    post 'sign_in' do
      user = User.find_by_email params[:email]

      error! "Email #{params[:email]} or password is invalid", 500 unless user

      error!  "Email #{params[:email]} or password is invalid", 500 unless user.valid_password? params[:password]

      secret_key= generate_token_for_user user

      status 200
      {token: secret_key.token}
    end

    desc 'Logout'
    delete :logout do

      authenticated_user?
      apiKey= UserApiToken.find_by_token headers['Token']
      apiKey.destroy

      status 200
      {response: 'Logout successfully done'}

    end

  end

end
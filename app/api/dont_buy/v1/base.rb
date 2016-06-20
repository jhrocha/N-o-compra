module DontBuy
  module V1
    class Base < Grape::API
      prefix 'api'
      version 'v1', using: :path
      helpers do
        def authenticated_user?
          error! 'Unauthorized. Invalid or expired token.', 401 unless current_user
        end

        def current_user
          token = UserApiToken.find_by_token headers['Token']
          if token
            @current_user = User.find(token.user_id)
          else
            false
          end
        end

        def is_admin?
          user_role= UserRole.find_by(user_id:@current_user.id)
          role= Role.find user_role.role_id
          error! "Access denied for this endpoint", 500 unless role.description == 'admin'
        end
      end

      mount Causes
      mount Auth
      mount AdminStatistics
      route :any, '*path' do
        error!('This is not the endpoint you\'re looking for!', 404)
      end
    end
  end
end

class UserRole < ActiveRecord::Base
  has_one :role
  belongs_to :user
end

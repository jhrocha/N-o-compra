class SalesManDontBuy < ActiveRecord::Base
  belongs_to :user
  has_one :cause
end

class SalesManDontBuy < ActiveRecord::Base
  belongs_to :user
  belongs_to :causes
end

class Cause < ActiveRecord::Base
  belongs_to :sales_man_dont_buy
  has_one :customer
end

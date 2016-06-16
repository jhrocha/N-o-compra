class Cause < ActiveRecord::Base
  has_one :sales_man_dont_buy
  has_one :customer
end

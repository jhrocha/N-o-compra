class Customer < ActiveRecord::Base
  belongs_to :cause
  has_one :gender
  has_one :age_group
end

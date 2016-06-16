class Customer < ActiveRecord::Base
  belongs_to :cause
  has_one :gender
  belongs_to :age_group
end

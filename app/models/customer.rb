class Customer < ActiveRecord::Base
  has_one :gender
  belongs_to :age_group
end

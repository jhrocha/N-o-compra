class AddCustomerRefToCauses < ActiveRecord::Migration
  def change
    add_reference :causes, :customer, index: true, foreign_key: true
  end
end

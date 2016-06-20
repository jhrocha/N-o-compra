class AddReferenceToCustomer < ActiveRecord::Migration
  def change
    add_reference :customers, :gender, index: true, foreign_key: true
  end
end

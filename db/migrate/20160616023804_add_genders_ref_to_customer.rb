class AddGendersRefToCustomer < ActiveRecord::Migration
  def change
    add_reference :genders, :customer, index: true, foreign_key: true
  end
end

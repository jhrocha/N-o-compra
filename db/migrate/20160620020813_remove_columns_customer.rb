class RemoveColumnsCustomer < ActiveRecord::Migration
  def change
    remove_column :genders, :customer_id
    remove_column :causes, :customer_id
  end
end

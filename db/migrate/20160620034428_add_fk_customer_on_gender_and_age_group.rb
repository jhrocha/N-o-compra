class AddFkCustomerOnGenderAndAgeGroup < ActiveRecord::Migration
  def change
    add_reference :age_groups, :customer, index: true, foreign_key: true
    add_reference :genders, :customer, index: true, foreign_key: true
  end
end

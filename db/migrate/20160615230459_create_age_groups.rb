class CreateAgeGroups < ActiveRecord::Migration
  def change
    create_table :age_groups do |t|
      t.belongs_to :customers
      t.timestamps null: false
    end
  end
end

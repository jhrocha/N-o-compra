class CreateAgeGroups < ActiveRecord::Migration
  def change
    create_table :age_groups do |t|
      t.string :description
      t.integer :initial_age
      t.integer :final_age
      t.timestamps null: false
    end
  end
end

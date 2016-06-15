class CreateAgeGroups < ActiveRecord::Migration
  def change
    create_table :age_groups do |t|

      t.timestamps null: false
    end
  end
end

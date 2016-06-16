class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.belongs_to :cause, index: false, foreign_key: true
      t.belongs_to :age_group, index: false, foreign_key: true
      t.timestamps null: false
    end
  end
end

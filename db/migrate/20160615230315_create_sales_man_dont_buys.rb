class CreateSalesManDontBuys < ActiveRecord::Migration
  def change
    create_table :sales_man_dont_buys do |t|
      t.belongs_to :user, index: false, foreign_key: true
      # t.belongs_to :cause, index: false, foreign_key: true
      t.timestamps null: false
    end
  end
end

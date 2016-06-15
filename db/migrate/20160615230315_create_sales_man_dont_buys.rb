class CreateSalesManDontBuys < ActiveRecord::Migration
  def change
    create_table :sales_man_dont_buys do |t|

      t.timestamps null: false
    end
  end
end

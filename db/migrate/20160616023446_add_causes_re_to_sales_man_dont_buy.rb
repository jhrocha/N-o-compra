class AddCausesReToSalesManDontBuy < ActiveRecord::Migration
  def change
    add_reference :causes, :sales_man_dont_buy, index: true, foreign_key: true
  end
end

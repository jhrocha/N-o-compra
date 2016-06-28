class AddVisitedDateOnCause < ActiveRecord::Migration
  def change
    add_column :causes, :visited_at, :string
  end
end

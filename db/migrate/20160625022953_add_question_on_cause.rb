class AddQuestionOnCause < ActiveRecord::Migration
  def change
    add_column :causes, :question, :string
    add_column :causes, :answer, :string
  end
end

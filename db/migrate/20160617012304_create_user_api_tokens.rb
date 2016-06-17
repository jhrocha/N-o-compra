class CreateUserApiTokens < ActiveRecord::Migration
  def change
    create_table :user_api_tokens do |t|
      t.string :token
      t.belongs_to  :user, index: false, foreign_key: true
      t.timestamps null: false
    end
  end
end

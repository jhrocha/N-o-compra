class CreateUserRoles < ActiveRecord::Migration
  def change
    create_table :user_roles do |t|
      # t.belongs_to :roles, index: false, foreign_key: true
      t.belongs_to  :user, index: false, foreign_key: true
      t.timestamps null: false
    end
  end
end

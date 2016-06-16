class AddRolesRefToUserRoles < ActiveRecord::Migration
  def change
    add_reference :user_roles, :role, index: true, foreign_key: true
  end
end

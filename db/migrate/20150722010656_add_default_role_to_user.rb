class AddDefaultRoleToUser < ActiveRecord::Migration
  def change
    change_column :users, :role, :string, :default => 'registered'
  end
end

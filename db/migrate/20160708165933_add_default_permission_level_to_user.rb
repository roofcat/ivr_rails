class AddDefaultPermissionLevelToUser < ActiveRecord::Migration[5.0]
  def up
    change_column :users, :permission_level, :integer, default: 1
  end
end

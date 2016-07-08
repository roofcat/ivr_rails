class ChangeIntegerFieldsToCall < ActiveRecord::Migration[5.0]
  def up
    change_column :calls, :key, :bigint
    change_column :calls, :origin, :bigint
    change_column :calls, :IVRSel, :bigint
    change_column :calls, :dialIntentCaller1, :bigint
    change_column :calls, :dialIntentCalled1, :bigint
  end
end

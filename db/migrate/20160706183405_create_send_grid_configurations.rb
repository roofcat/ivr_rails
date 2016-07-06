class CreateSendGridConfigurations < ActiveRecord::Migration[5.0]
  def change
    create_table :send_grid_configurations do |t|

      t.string :api_key
      t.string :api_user
      t.string :api_pass
      t.string :email_from
      t.string :email_from_name
      t.string :email_subject

      t.timestamps
    end
  end
end

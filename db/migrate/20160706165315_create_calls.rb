class CreateCalls < ActiveRecord::Migration[5.0]
  def change
    create_table :calls do |t|
      t.string :collection
      t.string :sp
      t.integer :key
      t.datetime :beginCall
      t.integer :origin
      t.boolean :callAnswered
      t.string :lastState
      t.integer :IVRSel
      t.datetime :dialIntentBegin1
      t.integer :dialIntentCaller1
      t.integer :dialIntentCalled1
      t.datetime :dialIntentEnd1
      t.boolean :dialIntentAnswered1
      t.string :sessionFile
      t.string :hc
      t.string :routing
      t.string :name
      t.datetime :endDial
      t.datetime :timeStamp

      t.timestamps
    end
  end
end

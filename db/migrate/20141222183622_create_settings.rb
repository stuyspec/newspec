class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :type, :null => false
      t.string :value

      t.timestamps
    end

    add_index :settings, :type, :unique => true
  end
end

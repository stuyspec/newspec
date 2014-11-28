class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first
      t.string :last
      t.string :email

      t.timestamps
    end
  end
end

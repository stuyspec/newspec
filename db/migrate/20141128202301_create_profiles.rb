class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first
      t.string :last
      t.string :email

      t.timestamps
    end

    change_table :users do |t|
      t.belongs_to :profile, index: true
    end

  end
end

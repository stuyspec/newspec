class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string     :name, null: false
      t.string     :capabilities, :array => true, :default => '{}'
      t.boolean    :default, default: false

      t.timestamps
    end

    change_table :users do |t|
      t.belongs_to :role, index: true
    end

  end
end

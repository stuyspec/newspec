class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string     :name, null: false
      t.string     :capabilities, :array => true, :default => '{}'
      t.boolean    :default, default: false

      t.timestamps
    end

    add_reference :roles, :user, index: true
  end
end

class CreateAuthor < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :first, null: false
      t.string :last,  null: false
      t.string :slug,  null: false
    end
  end
end

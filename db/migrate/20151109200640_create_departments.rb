class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name, null: false, index: true

      t.timestamps null: false
    end

    add_belongs_to :articles, :department, :foreign_key => true
  end
end

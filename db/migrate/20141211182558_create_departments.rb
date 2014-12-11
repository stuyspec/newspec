class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.belongs_to :editor, index: true

      t.timestamps
    end

    change_table :articles do |t|
      t.belongs_to :department, index: true
    end

    change_table :users do |t|
      t.belongs_to :department, index: true
    end

  end
end

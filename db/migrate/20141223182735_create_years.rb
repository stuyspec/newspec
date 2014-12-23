class CreateYears < ActiveRecord::Migration
  def change
    create_table :years do |t|
      t.integer :year

      t.timestamps
    end

    change_table :issues do |t|
      t.belongs_to :year
    end
  end
end

class MakeDefaultNameEmptyStringForProfile < ActiveRecord::Migration
  def change
    change_column :profiles, :first, :string, :default => '', :null => false
    change_column :profiles, :last, :string, :default => '', :null => false
  end
end

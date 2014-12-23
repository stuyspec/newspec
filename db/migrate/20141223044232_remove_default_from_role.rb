class RemoveDefaultFromRole < ActiveRecord::Migration
  def change
    remove_column :roles, :default
  end
end
